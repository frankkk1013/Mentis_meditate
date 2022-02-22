//
//  Progress.swift
//  MentisMeditate
//
//  Created by Francesco Iaccarino on 16/02/22.
//

import SwiftUI

struct Section: View {
    var body: some View{
        VStack{
            HStack {
                //56%
                Spacer()
                Text("EXAWER").font(.system(size: 25, weight: .bold)).tracking(0.36)
                
                Spacer()
                //EXAWER
                
                Text("56%").font(.system(size: 25, weight: .bold)).foregroundColor(Color(#colorLiteral(red: 0.35, green: 0.34, blue: 0.84, alpha: 1))).tracking(0.36).multilineTextAlignment(.trailing)
                Spacer()
            }
            HStack{
                Spacer()
                elementday()
                Spacer()
                elementday()
                Spacer()
            }
            HStack{
                Spacer()
                elementday()
                Spacer()
                elementday()
                Spacer()
            }
            
            
        }
        
    }
    
}

struct elementday: View{
    var body: some View{
        HStack {
            
            
            //Rectangle 34
            RoundedRectangle(cornerRadius: 8)
                .fill(Color(#colorLiteral(red: 0.3450980484485626, green: 0.33725491166114807, blue: 0.8392156958580017, alpha: 1)))
                .frame(width: 28, height: 28)
            VStack{
                //Name of the lesson
                Text("TOMORROW").font(.system(size: 10, weight: .semibold)).foregroundColor(Color(#colorLiteral(red: 0.35, green: 0.34, blue: 0.84, alpha: 1))).tracking(0.38)
                Text("Name of the lesson").font(.system(size: 10, weight: .light)).foregroundColor(Color(#colorLiteral(red: 0.35, green: 0.34, blue: 0.84, alpha: 1))).tracking(0.38)
                
                
                
            }
        }
    }
}
struct Progress: View {
    var body: some View {
        
        
            VStack{
                
                Section()
                Spacer()
                Section()
                Spacer()
                Section()
                Spacer()


            }.padding()
            
        
       
    }
}

struct Progress_Previews: PreviewProvider {
    static var previews: some View {
        Progress()
    }
}


