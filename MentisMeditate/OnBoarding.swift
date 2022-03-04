//
//  OnBoarding.swift
//  MentisMeditate
//
//  Created by Francesco Iaccarino on 03/03/22.
//

import SwiftUI



struct OnBoarding: View {
    @AppStorage("needsAppOnboarding") private var needsAppOnboarding: Bool = true
    
    var body: some View {
        VStack {
            Spacer()
                Text("What's this")
                    .fontWeight(.heavy)
                    .font(.system(size: 50))
                    .frame(width: 300, alignment: .leading)
        
                
                VStack(alignment: .leading) {
                    NewDetail(image: "gyroscope", imageColor: Color("INNER PARTY"), title: "Powers", description: "You can see and choose you power and become a super hero")
                    NewDetail(image: "leaf.fill", imageColor: Color("RISE AND SHINE"), title: "Journey", description: "You can add your choosen super hero path in the Journey tab                               ")
                    NewDetail(image: "headphones", imageColor: Color("EXAWER"), title: "Sounds", description: "You can select a background sound while you are studying or just chilling")
            }

            Spacer()
            
            Button(action: {
                UserDefaults.standard.set(true, forKey: "LaunchBefore")
                withAnimation(){
                    needsAppOnboarding = false
                   
                }
            }){
            Text("Next")
                .foregroundColor(.white)
                .font(.headline)
                .frame(width: 320, height: 60)
                .background(Color.indigo)
                .cornerRadius(15)
                .padding(.top, 50)
                
            }.padding()
        }
    }
}

struct NewDetail: View {
    var image: String
    var imageColor: Color
    var title: String
    var description: String

    var body: some View {
        HStack(alignment: .center) {
            HStack {
                Image(systemName: image)
                    .font(.system(size: 50))
                    .frame(width: 50)
                    .foregroundColor(imageColor)
                    .padding()

                VStack(alignment: .leading) {
                    Text(title).bold()
                
                    Text(description)
                        .fixedSize(horizontal: false, vertical: true)
                }
            }.frame(width: 340, height: 100)
        }
    }
}

struct OnBoarding_Previews: PreviewProvider {
    static var previews: some View {
        OnBoarding()
        OnBoarding().previewDevice("iPhone 8")
    }
}
