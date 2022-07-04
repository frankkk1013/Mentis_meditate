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
                Text(NSLocalizedString("What's Mentis", comment: ""))
                    .fontWeight(.heavy)
                    .font(.system(size: 50))
                    .frame(width: 300, alignment: .leading)
        
                
                VStack(alignment: .leading) {
                    NewDetail(image: "gyroscope", imageColor: Color("INNER PARTY"), title: NSLocalizedString( "Powers", comment: ""), description: NSLocalizedString("You can see and choose your power and become a super hero", comment: "") )
                    NewDetail(image: "leaf.fill", imageColor: Color.orange, title: NSLocalizedString( "Journey", comment: ""), description:
                                NSLocalizedString("You can add your choosen super hero path in the Journey tab ", comment: ""))
                    NewDetail(image: "headphones", imageColor: Color("EXAWER"), title:NSLocalizedString( "Sounds", comment: ""), description:
                                NSLocalizedString("You can select a background sound while you are studying or just chilling", comment: "")
                                )
            }

            Spacer()
            
            Button(action: {
                UserDefaults.standard.set(true, forKey: "LaunchBefore")
                withAnimation(){
                    needsAppOnboarding = false
                   
                }
            }){
            Text(NSLocalizedString("Next", comment: ""))
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
