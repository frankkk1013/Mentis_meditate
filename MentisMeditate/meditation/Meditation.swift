//
//  Meditation.swift
//  MentisMeditate
//
//  Created by Francesco Iaccarino on 28/02/22.
//

import SwiftUI
import AVFoundation



struct Meditation: View {
    
    @State var positionX = -300
    @State private var tabBar: UITabBar?
    let timer = Timer.publish(every: 10, on: .current, in: .common).autoconnect()
    @State var index: Int = 1
    var duration: String
    var voice: Bool
    var title: String
    
    @State var text: [String]
    @State var textToShow: String = ""
    
    @State var audioPlayer: AVAudioPlayer?

    func playSound() {
        
        if NSLocalizedString("eng", comment: "").contains("eng"){
            if let path = Bundle.main.path(forResource:"\(title) eng \(duration.filter {!$0.isWhitespace})", ofType: "m4a") {
                do {
                    try AVAudioSession.sharedInstance().setCategory(.playback)
                    audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
                    audioPlayer?.play()
                } catch {
                    print("ERROR")
                }
            }
            
        }else{
            if let path = Bundle.main.path(forResource:"\(title) ita \(duration.filter {!$0.isWhitespace})", ofType: "m4a") {
                do {
                    audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
                    audioPlayer?.play()
                } catch {
                    print("ERROR")
                }
            }
            
        }
       
    }
    
    var body: some View {
        
            ZStack{
                
                Color(#colorLiteral(red: 0.9154947400093079, green: 0.9134374856948853, blue: 0.987500011920929, alpha: 1)).ignoresSafeArea()
                ZStack {
                    //Ellipse 3
                    Ellipse()
                        .fill(Color(#colorLiteral(red: 0.8569612503051758, green: 0.8547569513320923, blue: 0.9958333373069763, alpha: 1)))
                        .frame(width: 477, height: 603)
                        .rotationEffect(.degrees(-40))
                        .offset(x: CGFloat(-positionX), y:CGFloat(positionX))
                        .animation(Animation.easeIn(duration: 3).repeatForever(autoreverses: true).speed(0.05))
                    
                    
                    Ellipse()
                        .fill(Color(#colorLiteral(red: 0.8569612503051758, green: 0.8547569513320923, blue: 0.9958333373069763, alpha: 1)))
                        .frame(width: 477, height: 603)
                        .rotationEffect(.degrees(-40))
                        .offset(x: CGFloat( +positionX), y:CGFloat( -positionX))
                        .animation(Animation.easeIn(duration: 3).repeatForever(autoreverses: true).speed(0.05))
                    
                    
                    
                }.onAppear{
                    
                    positionX += 700
                    
                    
                    
                }
                //motivation
                
                VStack{
                    if !voice{
                        Text(textToShow).font(.title3).bold()
                            .foregroundColor(Color(#colorLiteral(red: 0.35, green: 0.34, blue: 0.84, alpha: 1))).tracking(0.36).lineLimit(6)
                            .multilineTextAlignment(.center)
                            .animation(.easeInOut)
                            .onReceive(timer) { input in
                            if(index) <  (text.count){
                                self.textToShow = text[index]
                                index += 1
                            }else {
                                textToShow = NSLocalizedString("bye bye", comment: "")
                            }
                        }
                        
                    }else{
                        Text(title).font(.title).bold()
                            .foregroundColor(Color(#colorLiteral(red: 0.35, green: 0.34, blue: 0.84, alpha: 1))).tracking(0.36).lineLimit(6)
                            .multilineTextAlignment(.center)
                            
                        
                    }
                    
                    
                }.frame(maxWidth: .infinity, maxHeight: .infinity)
                    .padding(.trailing, 60)
                    .padding(.leading, 60)
                
                
                
            
        }
        .navigationBarTitleDisplayMode(.inline)
            .edgesIgnoringSafeArea(.top)
            .onAppear{
                if voice{
                    playSound()
                    textToShow = title
                    
                }else{
                    textToShow = text[0]
                    
                }
                
               
            }.onDisappear{
                audioPlayer?.stop()
                
            }
            .statusBar(hidden: true)
            .introspectTabBarController { UITabBarController in tabBar = UITabBarController.tabBar
                self.tabBar?.isHidden = true } .onDisappear() { self.tabBar?.isHidden = false }
                
        
        
    }
}

struct Meditation_Previews: PreviewProvider {
    static var previews: some View {
        Meditation( duration: "", voice: true, title: "SENSE DRILL", text: [""])
    }
}
