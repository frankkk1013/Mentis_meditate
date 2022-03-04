//
//  Player_audio.swift
//  MentisMeditate
//
//  Created by Alessia Parnoffi on 22/02/22.
//

import SwiftUI
import AVKit
struct Player_audio: View {
    let category: Category
    @State private var showModalAdd: Bool = false
    var body: some View {
        MusicPlayer(showModal: $showModalAdd)
    }
}

//struct Player_audio_Previews: PreviewProvider {
//    let category: Category
//    static var previews: some View {
//        Player_audio(category: category)
//    }
//}

struct MusicPlayer: View {
    @Binding var showModal: Bool
    var height = UIScreen.main.bounds.height / 3
    @State var data : Data = .init(count: 0)
    @State var title = ""
    @State var player : AVAudioPlayer!
    @State var playing = false
    @State var width : CGFloat = 0
    @State var songs = ["Suono campane di Chiesa","Verso del cane","Completamente","Emotional Music"]
    @State var current = 0
    @State var finish = false
    @State var del = AVdelegate()
    @State var backgrounds = ["Londra","Sunset","pioggia","mare"]

    

    var body: some View {
        
        VStack{
            VStack {
                Spacer()
                ZStack(alignment: .leading){
                    
                    Capsule().fill(Color.white.opacity(0.60)).frame(height: 5).padding(.top)
                    Capsule().fill(Color(red: 88/255, green: 86/255, blue: 214/255)).frame(width: self.width, height: 5).padding(.top)
                        .gesture(DragGesture()
                                    .onChanged({ (value) in
                            let x = value.location.x
                            self.width = x
                            
                        }).onEnded({ (value) in
                            let x = value.location.x
                            let screen = UIScreen.main.bounds.width - 35
                            let percent = x / screen
                            self.player.currentTime = Double(percent) * self.player.duration
                        }))
                }
                
                .padding(.top)
                HStack(spacing: UIScreen.main.bounds.width / 5 - 35){
                    Button(action: {
                        if self.current > 0 {
                            self.current -= 1
                            self.ChangeSongs()
                          

                        }
                    }) {
                        Image(systemName: "backward.fill").font(.title).foregroundColor(Color(.white))
                    }
                    
                    Button(action: {
                        if self.player.isPlaying{
                            self.player.pause()
                            self.playing = false
                        }
                        else{
                            
                            if self.finish{
                                self.player.currentTime = 0
                                self.width = 0
                                self.finish = false
                            }
                            
                            self.player.play()
                            self.playing = true
                        }
                    }) {
                        Image(systemName: self.playing && !self.finish ? "pause.fill" : "play.fill" ).font(.title).foregroundColor(Color(.white))
                    }
                    
                    Button(action: {
                        if self.current < self.songs.count - 1 {
                            self.current += 1
                            self.ChangeSongs()
                        }
        
                        
                    }) {
                        Image(systemName: "forward.fill").font(.title).foregroundColor(Color(.white))
                    }
                }.padding()
            }
            .foregroundColor(.black)
            
        }.onAppear {
            
            let url = Bundle.main.path(forResource: self.songs[self.current], ofType: "mp3")
            
            self.player = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: url!))
            
            self.player.delegate = self.del
            
            self.player.prepareToPlay()
            self.getData()
            
            Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { (_) in
                
                if self.player.isPlaying{
                    
                    let screen = UIScreen.main.bounds.width - 35
                    
                    let value = self.player.currentTime / self.player.duration
                    
                    self.width = screen * CGFloat(value)
                }
            }
            NotificationCenter.default.addObserver(forName:  NSNotification.Name("Finish"), object: nil, queue: .main) { (_) in
                self.finish = true
            }
        }.background (
            Image(uiImage: self.data.count == 0 ? UIImage(named: self.backgrounds[self.current])! : UIImage(data: self.data)!)
//            Image(category.image)
                .resizable()
                .edgesIgnoringSafeArea(.all)
                .opacity(0.75)
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        )
            .overlay(alignment: .topTrailing) {
                Button {
                    withAnimation(.spring()) {
                        showModal.toggle()
                    }
                } label: {
                        Image(systemName: "x.circle.fill")
                        .foregroundColor(.white)
                        .font(.largeTitle)
                
                }
                .padding(32)
            }
    }
    
    func getData(){
        
        
        let asset = AVAsset(url: self.player.url!)
        
        for i in asset.commonMetadata {
            
            if i.commonKey?.rawValue == "artwork" {
                
                let data = i.value as! Data
                self.data = data
            }
            
            if i.commonKey?.rawValue == "title" {
                
                let title = i.value as! String
                self.title = title
            }
            
        }
    }
    
    func ChangeSongs(){
        
        let url = Bundle.main.path(forResource: self.songs[self.current], ofType: "mp3")
        self.player = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: url!))
        self.player.delegate = self.del
        self.data = .init(count: 0)
        self.title = ""
        self.player.prepareToPlay()
        self.getData()
        self.playing = true
        self.finish = false
        self.width = 0
        self.player.play()
    }
}




class AVdelegate : NSObject,AVAudioPlayerDelegate{
    
    func audioPlayerDecodeErrorDidOccur(_ player: AVAudioPlayer, successfully flag: Bool) {
        NotificationCenter.default.post(name: NSNotification.Name("Finish"), object: nil)
    }
}
