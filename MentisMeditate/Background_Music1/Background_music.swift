import SwiftUI

struct Background_music: View {
    @State var tapped: Bool = false
    var body: some View {

        List{
            Text("hello")
            Text("hello")
            Text("hello")
            Text("hello")
            //da inserire for each
            
        }
        .navigationBarTitle(Text("Playlist"))
        .navigationBarBackButtonHidden(true)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct Background_music_Previews: PreviewProvider {
    static var previews: some View {
        Background_music()
    }
}
