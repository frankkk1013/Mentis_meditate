//
//  Breathing.swift
//  MentisMeditate
//
//  Created by Francesco Iaccarino on 17/02/22.
//

import SwiftUI
import Introspect

struct Breathing: View {
    @State private var breathIn = false
    @State private var breathOut = false
//    @State private var displayHold = false
    @State private var hold = true
//    @State private var displayBreathOut = false
//    @State private var hideBreathOut = false
//    @State private var hideBreathIn = false
//    @State private var hideHold = false
//    @State private var displaySecondHold = false
//    @State private var hideSecondHold = false
    @State private var tabBar: UITabBar?
    let timer = Timer.publish(every: 4, on: .current, in: .common).autoconnect()
    let timerAnimation = Timer.publish(every: 16, on: .current, in: .common).autoconnect()
    @State var minutes = 0
   
    @State var text = "Hello"
    @State var index = -1
    var breathing = ["Breath in", "Hold", "Breathe out", "Hold" ]
    
    var body: some View {
        //Ellipse 5
        ZStack {
        //Ellipse 5
            Circle()
            .fill(Color(#colorLiteral(red: 0.8434115052223206, green: 0.8413889408111572, blue: 0.970833420753479, alpha: 1)))
            .frame(width: 200, height: 200)
//            Text("BREATH")

        //Ellipse 4
            Circle()
            .fill(Color(#colorLiteral(red: 0.345098078250885, green: 0.33725494146347046, blue: 0.8392156958580017, alpha: 0.2800000011920929)))
            
            .frame(width: 360, height: 360)
            .scaleEffect(breathIn ? 1 : 0.8)
            .scaleEffect(hold ? 1 : 1)
            .scaleEffect(breathOut ? 0.8 : 1)
            .onReceive(timerAnimation, perform: { input in
                self.breathIn = false
                self.breathOut = false
                self.hold = false
                
                withAnimation(Animation.linear(duration: 4).delay(4)){

                    self.breathIn.toggle()
                }
                withAnimation(Animation.linear(duration: 4).delay(8)){
                    self.hold.toggle()
                }
                withAnimation(Animation.linear(duration: 4).delay(12)){
                    self.breathOut.toggle()
                }
                withAnimation(Animation.linear(duration: 4).delay(16)){
                    self.hold.toggle()
                }
                
                
                
            })

            
            .onAppear(){
                
                withAnimation(Animation.linear(duration: 4).delay(4)){

                    self.breathIn.toggle()
                    
                }

                withAnimation(Animation.linear(duration: 4).delay(8)){
                    self.hold.toggle()
                }
                withAnimation(Animation.linear(duration: 4).delay(12)){
                    self.breathOut.toggle()
                }
                withAnimation(Animation.linear(duration: 4).delay(16)){
                    self.hold.toggle()
                }

                

                
            }
            ZStack {
               
                    
                Text(text).bold()
                    .foregroundColor(.indigo).brightness(-0.05)
                        
                        .font(.title).animation(.spring())
                        .onReceive(timer) { input in
                            minutes+=1
                            
                            if minutes != 45 {
                                if index == 3{
                                    self.index = 0
                                }else{
                                    self.index+=1
                                }
                                self.text = breathing[index]
                                print("hello")
                                print("\(self.breathIn) + \(self.breathOut) + \(self.hold)")
                            }else{
                                self.text = "You are ready"
                            }
                        }
                    
                
               
                
//                Text("Breath Out")
//                    .foregroundColor(.indigo).brightness(-0.5)
//                    .scaleEffect(1)
//                    .font(.title3)
//                    .opacity(displayBreathOut ? 1 : 0)
//                    .opacity(hideBreathOut ? 0 : 1)
//                    .onAppear(){
//                        withAnimation(Animation.easeInOut(duration: 0.4).delay(8)) {
//                             self.displayBreathOut.toggle()
//                        }
//
//                        withAnimation(Animation.easeInOut(duration: 0.4).delay(12)) {
//                             self.hideBreathOut.toggle()
//                        }
//
//                }
//
//                Text("Hold") // Second hold
//                    .foregroundColor(.indigo).brightness(-0.5)
//                    .scaleEffect(1)
//                    .font(.title3)
//                    .opacity(displaySecondHold ? 1 : 0)
//                    .opacity(hideSecondHold ? 0 : 1)
//                    .onAppear(){
//                        withAnimation(Animation.easeInOut(duration: 0.4).delay(12)) {
//                             self.displaySecondHold.toggle()
//                        }
//
//                        withAnimation(Animation.easeInOut(duration: 0.4).delay(16)) {
//                             self.hideSecondHold.toggle()
//                        }
//
//                }
//
//                Text("Hold")
//                    .foregroundColor(.indigo).brightness(-0.5)
//                    .scaleEffect(1)
//                    .font(.title3)
//                    .opacity(displayHold ? 1 : 0)
//                    .opacity(hideHold ? 0 : 1)
//                    .onAppear(){
//                        withAnimation(Animation.easeInOut(duration: 0.4).delay(4)) {
//                             self.displayHold.toggle()
//                        }
//
//                        withAnimation(Animation.easeInOut(duration: 0.4).delay(8)) {
//                             self.hideHold.toggle()
//                        }
//                }
//
//                Text("Breath In")
//                    .foregroundColor(.indigo).brightness(-0.5)
//                    .opacity(hideBreathIn ? 0 : 1)
//                    .font(.title3)
//                    .animation(Animation.easeInOut(duration: 0.4).delay(4))
//                    .onAppear(){
//                        self.hideBreathIn.toggle()
//                }
            }
        }.navigationBarTitleDisplayMode(.inline)
            .introspectTabBarController { UITabBarController in tabBar = UITabBarController.tabBar
            self.tabBar?.isHidden = true }
            .onDisappear() { self.tabBar?.isHidden = false }
        
           
            
            
    }
}

struct Breathing_Previews: PreviewProvider {
    static var previews: some View {
        Breathing()
    }
}
