import SwiftUI

struct ItemRowMusic : View{
   
    var text: String
    var img: String
    var body: some View {
        HStack {
            //Rectangle 34
            Image(img)
                .resizable()
                .frame(width: 70, height: 70)
                
            Text(self.text)
                
            
               
               
            
        }
    }
}

struct Background_music: View {
    @State var tapped: Bool = false
    var body: some View {

        List{
            ItemRowMusic(text: "hello", img: "EXAWER")
            
            ItemRowMusic(text: "hello", img: "EXAWER")
            
            
        
            //da inserire for each
            
        }
        
    }
}

struct Background_music_Previews: PreviewProvider {
    static var previews: some View {
        Background_music()
    }
}
