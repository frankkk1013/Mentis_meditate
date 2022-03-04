//
//  Meditation.swift
//  MentisMeditate
//
//  Created by Francesco Iaccarino on 28/02/22.
//

import SwiftUI

struct Meditation: View {
    
    @State var positionX = -300
    @State private var tabBar: UITabBar?
    
    
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
                .animation(Animation.easeIn(duration: 3).repeatForever(autoreverses: true).speed(0.1))
                
                
                Ellipse()
                .fill(Color(#colorLiteral(red: 0.8569612503051758, green: 0.8547569513320923, blue: 0.9958333373069763, alpha: 1)))
                .frame(width: 477, height: 603)
                .rotationEffect(.degrees(-40))
                .offset(x: CGFloat( +positionX), y:CGFloat( -positionX))
                .animation(Animation.easeIn(duration: 3).repeatForever(autoreverses: true).speed(0.1))

         
                
            }.onAppear{
                
                positionX += 700
            }
            //motivation
            Text("motivation").font(.system(size: 36, weight: .semibold)).foregroundColor(Color(#colorLiteral(red: 0.35, green: 0.34, blue: 0.84, alpha: 1))).tracking(0.36).multilineTextAlignment(.center)
            
            
        }.navigationBarTitleDisplayMode(.inline)
            .edgesIgnoringSafeArea(.top)
            .statusBar(hidden: true)
            .introspectTabBarController { UITabBarController in tabBar = UITabBarController.tabBar
                            self.tabBar?.isHidden = true } .onDisappear() { self.tabBar?.isHidden = false }

        
    }
}

struct Meditation_Previews: PreviewProvider {
    static var previews: some View {
        Meditation()
    }
}
