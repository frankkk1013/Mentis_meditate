import SwiftUI
var UIState : UIStateModel = UIStateModel()


struct SheetView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.presentationMode) var presentationMode
    
    
    var body: some View {
        NavigationView{
            
            VStack{
                Image("exawer")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 360, height: 262)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .frame(width: 313, height: 262)
                
                HStack {
                    
                    ZStack {
                        //hurry
                        //Rectangle 19
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Color(#colorLiteral(red: 0.7686274647712708, green: 0.7686274647712708, blue: 0.7686274647712708, alpha: 1)))
                            .frame(width: 45, height: 20)
                        Text("hurry").font(.system(size: 10, weight: .semibold))
                            .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))).multilineTextAlignment(.center)
                        
                    }
                    ZStack {
                        //worry
                        //Rectangle 20
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Color(#colorLiteral(red: 0.7686274647712708, green: 0.7686274647712708, blue: 0.7686274647712708, alpha: 1)))
                            .frame(width: 45, height: 20)
                        
                        Text("worry").font(.system(size: 10, weight: .semibold)).foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))).tracking(0.38).multilineTextAlignment(.center)
                    }
                    
                    //anxiety
                    ZStack {
                        //Rectangle 21
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Color(#colorLiteral(red: 0.7686274647712708, green: 0.7686274647712708, blue: 0.7686274647712708, alpha: 1)))
                            .frame(width: 45, height: 20)
                        Text("anxiety").font(.system(size: 10, weight: .semibold)).foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))).tracking(0.38).multilineTextAlignment(.center)
                    }
                    
                    //stress
                    ZStack {
                        //Rectangle 22
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Color(#colorLiteral(red: 0.7686274647712708, green: 0.7686274647712708, blue: 0.7686274647712708, alpha: 1)))
                            .frame(width: 45, height: 20)
                        Text("stress").font(.system(size: 10, weight: .semibold)).foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))).tracking(0.38).multilineTextAlignment(.center)
                    }
                    
                    //exam
                    ZStack {
                        //Rectangle 23
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Color(#colorLiteral(red: 0.7686274647712708, green: 0.7686274647712708, blue: 0.7686274647712708, alpha: 1)))
                            .frame(width: 45, height: 20)
                        Text("exam").font(.system(size: 10, weight: .semibold)).foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))).tracking(0.38).multilineTextAlignment(.center)
                    }
                    
                }.frame(alignment: .leading)
                    .padding()
                
                
                
                //Lorem ipsum dolor sit amet...
                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua")
                    .frame(width: 360)
                    .font(.system(size: 14, weight: .medium)).foregroundColor(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.6)))
                    .padding()
                
                Button (action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/){
                    Text("START")
                        .font(.title3)
                        .fontWeight(.medium)
                        .foregroundColor(Color.white)
                        .frame(width: 358, height: 50)
                        .background((Color(#colorLiteral(red: 0.5411764979362488, green: 0.5333333611488342, blue: 0.886274516582489, alpha: 1))))
                        .cornerRadius(13)
                    
                }
                .padding()
               
            }
            .navigationTitle("Exawer")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        print("Edit button was tapped")
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
    
    @State var UIState: UIStateModel
    
    var body: some View {
        let spacing: CGFloat = 16
        let widthOfHiddenCards: CGFloat = 32 /// UIScreen.main.bounds.width - 10
        let cardHeight: CGFloat = 450
        
        let items = [
            Card(id: 0, name: "EXAWER"),
            Card(id: 1, name: "RISE AND SHINE"),
            Card(id: 2, name: "Lets"),
            Card(id: 3, name: "Go")
        ]
        
        return Canvas {
            /// TODO: find a way to avoid passing same arguments to Carousel and Item
            
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
                        cardHeight: cardHeight
                    ) {
                        Text("\(item.name)").font(.title)
                    }
                    .foregroundColor(Color.white)
                    .background(Color("surface"))
                    .cornerRadius(8)
                    .shadow(color: Color("shadow1"), radius: 4, x: 0, y: 4)
                    .transition(AnyTransition.slide)
                    .animation(.spring())
                }
            }.environmentObject(self.UIState)
        }
    }
}

struct Card: Decodable, Hashable, Identifiable {
    var id: Int
    var name: String = ""
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
        content
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
            .background(Color.white.edgesIgnoringSafeArea(.all))
    }
}

struct Item<Content: View>: View {
    @State private var showingSheet = false
    @EnvironmentObject var UIState: UIStateModel
    
    let cardWidth: CGFloat
    let cardHeight: CGFloat
    
    var _id: Int
    var content: Content
    
    @inlinable public init(
_id: Int,
spacing: CGFloat,
widthOfHiddenCards: CGFloat,
cardHeight: CGFloat,
    @ViewBuilder _ content: () -> Content
    ) {
        self.content = content()
        self.cardWidth = UIScreen.main.bounds.width - (widthOfHiddenCards*2) - (spacing*2) //279
        self.cardHeight = cardHeight
        self._id = _id
    }
    
    var body: some View {
        content
            .frame(width: cardWidth, height: _id == UIState.activeCard ? cardHeight : cardHeight - 60, alignment: .center).background(RoundedRectangle(cornerRadius: 25)
                                                                                                                                        .fill(Color(#colorLiteral(red: 0.5411764979362488, green: 0.5333333611488342, blue: 0.886274516582489, alpha: 1)))).onTapGesture {
                showingSheet.toggle()
            }.sheet(isPresented: $showingSheet) {
                SheetView()
            }
    }
}

struct SnapCarousel_Previews: PreviewProvider {
    
    
    static var previews: some View {
        SnapCarousel(UIState: UIState)
    }
}
