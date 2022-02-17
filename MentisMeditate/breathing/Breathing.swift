//
//  Breathing.swift
//  MentisMeditate
//
//  Created by Francesco Iaccarino on 17/02/22.
//

import SwiftUI

struct Breathing: View {
    @State private var breathIn = false
    @State private var breathOut = false
    @State private var hold = false
    var body: some View {
        //Ellipse 5
        ZStack {
        //Ellipse 5
            Circle()
            .fill(Color(#colorLiteral(red: 0.8434115052223206, green: 0.8413889408111572, blue: 0.970833420753479, alpha: 1)))
            .frame(width: 200, height: 200)

        //Ellipse 4
            Circle()
            .fill(Color(#colorLiteral(red: 0.345098078250885, green: 0.33725494146347046, blue: 0.8392156958580017, alpha: 0.2800000011920929)))
            
            .frame(width: 360, height: 360)
            .scaleEffect(breathIn ? 1 : 0.8)
            .scaleEffect(breathOut ? 0.8 : 1)
            .scaleEffect(hold ? 1 : 1)
            .onAppear(){
                withAnimation(Animation.linear(duration: 4)){
                    self.breathIn.toggle()
                }
                
                withAnimation(Animation.linear(duration: 4).delay(4)){
                    self.hold.toggle()
                }
                withAnimation(Animation.linear(duration: 4).delay(8)){
                    self.breathOut.toggle()
                }
                withAnimation(Animation.linear(duration: 4).delay(12)){
                    self.hold.toggle()
                }

                
            }
        }
    }
}

struct Breathing_Previews: PreviewProvider {
    static var previews: some View {
        Breathing()
    }
}
