import SwiftUI


struct Background_music: View {
    @State var text: String = ""
   
    var body: some View {
        NavigationView {
            ScrollView {
                ForEach(0..<(categories.count % 2 == 0 ? categories.count / 2 : categories.count / 2 + 1)) { i in
                    HStack {
                        FullImageRow3(category: categories[2 * i])
                        if 2 * i + 1 < categories.count {
                            FullImageRow3(category: categories[2 * i + 1])
                        }
                    }
                }
                .padding()
            }
        }
    }
}

struct Background_music_Previews: PreviewProvider {
    static var previews: some View {
        Background_music()
    }
}


struct FullImageRow3: View {
    @State private var showModalAdd: Bool = false
    @State private var isPresented = false
    let category: Category
    var columns: [GridItem] =
    Array(repeating: .init(.flexible()), count: 2)
    
    var body: some View {
        ZStack(alignment: .trailing){
            Button(action: {
                self.showModalAdd = true
            }, label: {
                Image (category.image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width:190, height: 190)
                    .cornerRadius(15)
                    .overlay (
                        Rectangle()
                            .foregroundColor(Color(red: 88/255, green: 86/255, blue: 214/255))
                            .cornerRadius(15)
                            .opacity(0.45)
                    )
            }).fullScreenCover(isPresented: self.$showModalAdd){
                Player_audio();
            }.foregroundColor(Color.black)
            
            Text(category.details)
                .bold()
                .font(.system(size: 35))
                .frame(alignment: .leading)
                .foregroundColor(.white)
                .padding(.top, 75)
                .padding(10)
        }
    }
}
