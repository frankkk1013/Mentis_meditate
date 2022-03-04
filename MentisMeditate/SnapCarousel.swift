import SwiftUI
var UIState : UIStateModel = UIStateModel()

class HideBarViewModel: ObservableObject {
    @Published var isHidden = false
}



struct SnapCarousel: View {
    
    @State var UIState: UIStateModel = UIStateModel()
    @State var showDetails: Bool = false
    @State var namePower: Int = -2
    @State var counter: Int = 0
    @ObservedObject var progress: UseProgress
    @Binding var tabSelection : Int
    
    
    var body: some View {
        let spacing: CGFloat = 16
        let widthOfHiddenCards: CGFloat = 32 /// UIScreen.main.bounds.width - 10
        let cardHeight: CGFloat = 450
        
        var items : [Card_Carousel] = []
//            Card_Carousel(id: 0, name: "EXAWER", cardColor: "carousel_exawer", motto: "Train this power for your exams!"),
//            Card_Carousel(id: 1, name: "RISE AND SHINE", cardColor: "carousel_riseandshine", motto: "Train this power for the perfect presentation!"),
//            Card_Carousel(id: 2, name: "INNER PARTY", cardColor: "carousel_innerparty", motto: "Train this power for to sit back and relax!"),
    
        
        MentisPaths.paths.forEach { path in
            items.append(
                Card_Carousel(id: path.id, name: path.title, cardColor: path.color, motto: path.subtitle)
            
            )
            
        }
        
        
        
        return Canvas {
            
            
            
            Carousel(
                numberOfItems: CGFloat(items.count),
                spacing: spacing,
                widthOfHiddenCards: widthOfHiddenCards
            ) {
                ForEach(items, id: \.self.id) { item in
                    
                    Item(
                        _id: Int(item.id),
                        spacing: spacing,
                        widthOfHiddenCards: widthOfHiddenCards,
                        cardHeight: cardHeight,
                        cardColor: item.cardColor,
                        cardName: item.name
                    ) {
                        VStack {
                        //Train this power for your exams!
                            
                            Spacer()
                            Text(item.name).font(.system(size: 27, weight: .bold))
                                .foregroundColor(Color(item.cardColor))
                                .tracking(0.36).brightness(-0.3)
                                .saturation(3)
                            Image(item.name)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 360, height: 262)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .frame(width: 313, height: 262)
                            Text(item.motto).font(.system(size: 13, weight: .regular)).foregroundColor(Color(#colorLiteral(red: 0.42, green: 0.42, blue: 0.42, alpha: 1))).tracking(0.36)
                            Spacer()
                            

                        //EXAWER
                            
                        }.onTapGesture{
                            namePower =  MentisPaths.paths.firstIndex{$0.title == item.name}!
                            showDetails.toggle()
                            
                        }
                    }
                    .foregroundColor(Color.white)
//                    .background(Color("surface"))
                    .cornerRadius(8)
//                    .shadow(color: Color("shadow1"), radius: 4, x: 0, y: 4)
                    .transition(AnyTransition.slide)
                    .animation(.spring())
                }
            }.environmentObject(self.UIState)
                .background{
                    NavigationLink("", isActive: $showDetails, destination: { Pathdetails(tabSelection: $tabSelection,id: namePower, progress: progress)})
                }
                
        }
           
    }
}

struct Card_Carousel: Decodable, Hashable, Identifiable {
    var id: Int
    var name: String = ""
    var cardColor: String = ""
    var motto: String = ""
}

public class UIStateModel: ObservableObject {
    @Published var activeCard: Int = 0
    @Published var screenDrag: Float = 0.0
}

struct Carousel<Items : View> : View {
    let items: Items
    let numberOfItems: CGFloat //= 8
    let spacing: CGFloat //= 16
    let widthOfHiddenCards: CGFloat //= 32
    let totalSpacing: CGFloat
    let cardWidth: CGFloat
    
    @GestureState var isDetectingLongPress = false
    
    @EnvironmentObject var UIState: UIStateModel
    
    @inlinable public init(
numberOfItems: CGFloat,
spacing: CGFloat,
widthOfHiddenCards: CGFloat,
    @ViewBuilder _ items: () -> Items) {
        
        self.items = items()
        self.numberOfItems = numberOfItems
        self.spacing = spacing
        self.widthOfHiddenCards = widthOfHiddenCards
        self.totalSpacing = (numberOfItems - 1) * spacing
        self.cardWidth = UIScreen.main.bounds.width - (widthOfHiddenCards*2) - (spacing*2) //279
        
    }
    
    var body: some View {
        let totalCanvasWidth: CGFloat = (cardWidth * numberOfItems) + totalSpacing
        let xOffsetToShift = (totalCanvasWidth - UIScreen.main.bounds.width) / 2
        let leftPadding = widthOfHiddenCards + spacing
        let totalMovement = cardWidth + spacing
        
        let activeOffset = xOffsetToShift + (leftPadding) - (totalMovement * CGFloat(UIState.activeCard))
        let nextOffset = xOffsetToShift + (leftPadding) - (totalMovement * CGFloat(UIState.activeCard) + 1)
        
        var calcOffset = Float(activeOffset)
        
        if (calcOffset != Float(nextOffset)) {
            calcOffset = Float(activeOffset) + UIState.screenDrag
        }
        
        return HStack(alignment: .center, spacing: spacing) {
            items
        }
        .offset(x: CGFloat(calcOffset), y: 0)
        .gesture(DragGesture().updating($isDetectingLongPress) { currentState, gestureState, transaction in
            self.UIState.screenDrag = Float(currentState.translation.width)
            
        }.onEnded { value in
            self.UIState.screenDrag = 0
            
            if (value.translation.width < -50) &&  self.UIState.activeCard < Int(numberOfItems) - 1 {
                self.UIState.activeCard = self.UIState.activeCard + 1
                let impactMed = UIImpactFeedbackGenerator(style: .medium)
                impactMed.impactOccurred()
            }
            
            if (value.translation.width > 50) && self.UIState.activeCard > 0 {
                self.UIState.activeCard = self.UIState.activeCard - 1
                let impactMed = UIImpactFeedbackGenerator(style: .medium)
                impactMed.impactOccurred()
            }
        })
    }
}

struct Canvas<Content : View> : View {
    let content: Content
    @EnvironmentObject var UIState: UIStateModel
    
    @inlinable init(@ViewBuilder _ content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
      
            VStack{
                content
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
                    .background(Color.white.edgesIgnoringSafeArea(.all))
            }
            
            
       
        
           
            
        
    }
}

struct Item<Content: View>: View {
    @State private var showingSheet = false
    @State private var showJourney = false
    @EnvironmentObject var UIState: UIStateModel
    
    let cardWidth: CGFloat
    let cardHeight: CGFloat
    let cardColor : String
    let cardName : String
    
    var _id: Int
    var content: Content
    
    @inlinable public init(
_id: Int,
spacing: CGFloat,
widthOfHiddenCards: CGFloat,
cardHeight: CGFloat,
cardColor: String,
cardName: String,
    @ViewBuilder _ content: () -> Content
    ) {
        self.content = content()
        self.cardWidth = UIScreen.main.bounds.width - (widthOfHiddenCards*2) - (spacing*2) //279
        self.cardHeight = cardHeight
        self._id = _id
        self.cardColor = cardColor
        self.cardName = cardName
    }
    
    var body: some View {
//       NavigationView{
            VStack{

                
                content
                    .frame(width: cardWidth, height: _id == UIState.activeCard ? cardHeight : cardHeight - 60, alignment: .center).background(RoundedRectangle(cornerRadius: 25)
                                                                                                                                                .fill(Color(self.cardColor)))

            }
//
        
   
      
    }
}

//struct SnapCarousel_Previews: PreviewProvider {
//    
//    
//    static var previews: some View {
//        SnapCarousel(UIState: UIState)
//    }
//}




