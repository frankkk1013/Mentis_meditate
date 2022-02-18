import SwiftUI
var UIState : UIStateModel = UIStateModel()

class HideBarViewModel: ObservableObject {
    @Published var isHidden = false
}

struct SheetView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.presentationMode) var presentationMode
    var keywords = ["hurry", "worry", "anxiety", "stress", "exam"]
    @State var nameCard : String
   
    
    
    var body: some View {
        NavigationView{
            
            VStack{
                Image(nameCard)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 360, height: 262)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .frame(width: 313, height: 262)
            
                
                HStack(spacing: 25) {
                    
                    ZStack {
                        //hurry
                        //Rectangle 19
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Color(#colorLiteral(red: 0.7686274647712708, green: 0.7686274647712708, blue: 0.7686274647712708, alpha: 1)))
                            .frame(width: CGFloat(keywords[0].count + 50) , height: 20)
                        Text(keywords[0]).font(.system(size: 11, weight: .semibold))
                            .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))).multilineTextAlignment(.center)
                        
                    }
                    ZStack {
                        //worry
                        //Rectangle 20
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Color(#colorLiteral(red: 0.7686274647712708, green: 0.7686274647712708, blue: 0.7686274647712708, alpha: 1)))
                            .frame(width: CGFloat(keywords[1].count + 50), height: 20)
                        
                        Text(keywords[1]).font(.system(size: 11, weight: .semibold)).foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))).tracking(0.38).multilineTextAlignment(.center)
                    }
                    
                    //anxiety
                    ZStack {
                        //Rectangle 21
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Color(#colorLiteral(red: 0.7686274647712708, green: 0.7686274647712708, blue: 0.7686274647712708, alpha: 1)))
                            .frame(width: CGFloat(keywords[2].count + 50), height: 20)
                            
                        Text(keywords[2]).font(.system(size: 11, weight: .semibold)).foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))).tracking(0.38).multilineTextAlignment(.center)
                    }
                    
                    //stress
                    ZStack {
                        //Rectangle 22
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Color(#colorLiteral(red: 0.7686274647712708, green: 0.7686274647712708, blue: 0.7686274647712708, alpha: 1)))
                            .frame(width: CGFloat(keywords[3].count + 50), height: 20)
                        Text(keywords[3]).font(.system(size: 11, weight: .semibold)).foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))).tracking(0.38).multilineTextAlignment(.center)
                    }
                    
                    //exam
                    ZStack {
                        //Rectangle 23
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Color(#colorLiteral(red: 0.7686274647712708, green: 0.7686274647712708, blue: 0.7686274647712708, alpha: 1)))
                            .frame(width: CGFloat(keywords[4].count + 50), height: 20)
                        Text(keywords[4]).font(.system(size: 10, weight: .semibold)).foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))).tracking(0.38).multilineTextAlignment(.center)
                    }
                    
                }.frame(alignment: .leading)
                    .padding()
                
                
                
                //Lorem ipsum dolor sit amet...
                Text("Are you struggling with your next exam? This is the perfect path for you for being motivated and focused enough to face your challenge!")
                    .frame(width: 360)
                    .font(.system(size: 14, weight: .medium)).foregroundColor(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.6)))
                    .padding()
                
//g
                Button(action: {presentationMode.wrappedValue.dismiss()})
                {Text("add")}

//                NavigationLink("Add", destination: Journey() )

                    .font(.title3)
                  
                    .foregroundColor(Color.white)
                    .frame(width: 358, height: 50)
                    .background((Color.indigo))
                    .cornerRadius(13)
//                Button (action: {
//                    Journey()
//                }){
//                    Text("ADD")
//                        .font(.title3)
//                        .fontWeight(.medium)
//                        .foregroundColor(Color.white)
//                        .frame(width: 358, height: 50)
//                        .background((Color.indigo))
//                        .cornerRadius(13)
////                        .background((Color(#colorLiteral(red: 0.5411764979362488, green: 0.5333333611488342, blue: 0.886274516582489, alpha: 1))))
//                }
//                .padding()
               
            }
            .navigationTitle(nameCard)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Image(systemName: "chevron.backward")
                    }.foregroundColor(.indigo)
                }
                
                
                
                
                
            }
            
            
            
            
            //            Button (action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/){
            //                Image(systemName: "chevron.backward")
            //                    .foregroundColor(Color(.systemIndigo))
            //            }
            
            
            
        }
    }
    
   
}

struct SnapCarousel: View {
    
    @State var UIState: UIStateModel = UIStateModel()
    
    
    var body: some View {
        let spacing: CGFloat = 16
        let widthOfHiddenCards: CGFloat = 32 /// UIScreen.main.bounds.width - 10
        let cardHeight: CGFloat = 450
        let items = [
            Card_Carousel(id: 0, name: "EXAWER", cardColor: "carousel_violet", motto: "Train this power for your exams!"),
            Card_Carousel(id: 1, name: "EXAWER", cardColor: "carousel_violet", motto: "Train this power for your exams!"),
            Card_Carousel(id: 2, name: "EXAWER", cardColor: "carousel_violet", motto: "Train this power for your exams!"),
            Card_Carousel(id: 3, name: "Go", cardColor: "carousel_violet", motto: "Train this power for your exams!")
        ]
        
        
        
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
                            Text(item.name).font(.system(size: 24, weight: .bold)).foregroundColor(Color(#colorLiteral(red: 0.48, green: 0.38, blue: 1, alpha: 1))).tracking(0.36)
                            Image(item.name)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 360, height: 262)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .frame(width: 313, height: 262)
                            Text(item.motto).font(.system(size: 12, weight: .regular)).foregroundColor(Color(#colorLiteral(red: 0.42, green: 0.42, blue: 0.42, alpha: 1))).tracking(0.36)
                            Spacer()
                            

                        //EXAWER
                            
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
        NavigationView{
            VStack{
                content
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
                    .background(Color.white.edgesIgnoringSafeArea(.all))
            } .navigationBarHidden(true)
            
            
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
//        NavigationView{
//            VStack{
               NavigationLink("", isActive: $showJourney, destination: { Journey()})
                
                content
                    .frame(width: cardWidth, height: _id == UIState.activeCard ? cardHeight : cardHeight - 60, alignment: .center).background(RoundedRectangle(cornerRadius: 25)
                                                                                                                                                .fill(Color("carousel_violet"))).onTapGesture {
                        showingSheet.toggle()
                    }.sheet(isPresented: $showingSheet, onDismiss: {
                        showJourney.toggle()
                    }) {
                        SheetView(nameCard: self.cardName)
                    }
//            }
//        }
    }
}

struct SnapCarousel_Previews: PreviewProvider {
    
    
    static var previews: some View {
        SnapCarousel(UIState: UIState)
    }
}


