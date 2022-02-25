//
//  CardView.swift
//  CardView-SwiftUI
//
//  Created by Quentin on 2019/7/31.
//  Copyright © 2019 TotoroQ. All rights reserved.
//

import SwiftUI
import Combine
import StepperView



@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
struct IndicatorImageView: View {
    var name:String
    var body: some View {
        ZStack {
            Circle()
                .foregroundColor(Color.white)
                .overlay(Image(name)
                            .resizable()
                            .frame(width: 30, height: 30))
                .frame(width: 40, height: 40)
        }
        
    }
}

@available(iOS 13.0, OSX 10.15, tvOS 13.0, watchOS 6.0, *)
struct CustomStepTextView: View {
    var text:String
    var body: some View {
        VStack {
            TextView(text: text, font: Font.system(size: 16, weight: Font.Weight.regular))
                .foregroundColor(Color.black)
                .frame(maxWidth: .infinity, alignment: .leading)
                .offset(x: -15)
        }
    }
}


    

class CardView_Control: ObservableObject {
    @Published var anyTriggered = false
}

struct CardView: View {
    var subtitle: String
    var title: String
    var backgroundImage: Image
    var briefSummary: String
    var description: String
  
    @State var isPressedX = false
    @State var isShowDetail = false
    @EnvironmentObject var control: CardView_Control
    
    var body: some View {
        GeometryReader { geo in
            ZStack(alignment: .topTrailing){
                CardInnerView(subtitle: self.subtitle, title: self.title, backgroundImage: self.backgroundImage, briefSummary: self.briefSummary, description: self.description, isShow: self.$isShowDetail)
                    .onTapGesture {
                        if self.isShowDetail == false {
                            withAnimation(.interpolatingSpring(mass: 1, stiffness: 90, damping: 15, initialVelocity: 1)) {
                                self.isShowDetail.toggle()
                                self.control.anyTriggered.toggle()
                                    
                        }
                    }
                }
                if self.isShowDetail{
                    Button(action: {
                        withAnimation(.interpolatingSpring(mass: 1, stiffness: 90, damping: 15, initialVelocity: 1)) {
                            self.isShowDetail.toggle()
                            self.control.anyTriggered.toggle()
                            
                            
                    }
                    }) {
                        Image(systemName: "x.circle.fill")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .foregroundColor(.black)
                    }.padding()
                    .padding()
                    .padding(.top)
                    .padding(.top)
                    
                }
                
            }
                
                
                .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
                .offset(x: self.isShowDetail ? -geo.frame(in: .global).minX : 0, y: self.isShowDetail ? -geo.frame(in: .global).minY : 0)
                .frame(height: self.isShowDetail ? UIScreen.main.bounds.height : nil)
                .frame(width: self.isShowDetail ? UIScreen.main.bounds.width : nil)
                
                
                
                
                
            
            
        }
        .frame(width: UIScreen.main.bounds.width - 40)
        .frame(height: 300)
        .offset(x: control.anyTriggered && !isShowDetail ? UIScreen.main.bounds.width : 0)
       
        .opacity(control.anyTriggered && !isShowDetail ? 0 : 1)
        
        
        
        
        .navigationBarBackButtonHidden(true).edgesIgnoringSafeArea(.all)
    }
}


#if DEBUG
struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CardView(subtitle: "MEET THE DEVELOPER", title: "Insider VSCO's Imaging Lab", backgroundImage: Image("bg1"), briefSummary: "How VSCO brings analog authenticity to your digital shots", description: desPlaceholer, isShowDetail: false)
            .environmentObject(CardView_Control())
            
//            CardView(subtitle: "MEET THE DEVELOPER", title: "Insider VSCO's Imaging Lab", backgroundImage: Image("bg1"), briefSummary: "How VSCO brings analog authenticity to your digital shots", description: desPlaceholer, isShowDetail: true)
//
//            TopView(subtitle: "MEET THE DEVELOPER", title: "Insider VSCO's Imaging Lab", backgroundImage: Image("bg1"), briefSummary: "How VSCO brings analog authenticity to your digital shots")
//                .background(Color.black)
        }
    }
}
#endif

struct CardInnerView: View {
    var subtitle: String
    var title: String
    var backgroundImage: Image
    var briefSummary: String
    var description: String
    
    @Binding var isShow: Bool
    @State private var translation = CGSize.zero
    
    
    var body: some View {
        GeometryReader { geo in
            VStack(alignment: .leading){
                                    
                    TopView(subtitle: self.subtitle, title: self.title, backgroundImage: self.backgroundImage, briefSummary: self.briefSummary, isShow: self.$isShow)
                        .frame(height: 300)
                        .background(
                            self.backgroundImage
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(maxWidth: geo.size.width, maxHeight: geo.size.height)
                                .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
                                .opacity(0.8)
                        )
                        .offset(y: self.translation.height)
                   
                
                
                
                if self.isShow {
                    ScrollView {
                        ExpandableView(description: self.description, isShow: self.$isShow)
                            .transition(.opacity)
                    }
                    .navigationBarTitle("")
                    .navigationBarHidden(true)
                    
                    .navigationBarBackButtonHidden(true)
                }
            }
            .background(Color.white)
        }
    }
}

struct TopView: View {
    var subtitle: String
    var title: String
    var backgroundImage: Image
    var briefSummary: String
    @State private var showBreath = false
    
    @Binding var isShow: Bool
    
    var body: some View {
        GeometryReader { geo in
            VStack(alignment: .center, spacing: 0) {
                if self.isShow {
                    Rectangle()
                        .frame(height: UIApplication.shared.windows.first?.safeAreaInsets.top)
                        .frame(maxWidth: .infinity)
                        .foregroundColor(Color.clear)
                        .onTapGesture {
                            print(geo.safeAreaInsets.top)
                            
                        }
                }
                
                HStack {
                    VStack(alignment: .leading) {
                        Spacer()
//                        Text(self.subtitle)
//                            .font(.caption)
//                            .foregroundColor(.gray)
//                            .lineLimit(1)
                        
                        Text(self.title)
                            .font(.system(size: 40, weight: .heavy)).foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))).tracking(0.38).multilineTextAlignment(.center)
                            .lineLimit(3)
                    }
                    
                    Spacer()
                }
                .padding()
                
                Spacer()
                
                
                HStack(alignment: .center) {
                    VStack(alignment: .leading){
                    Text(self.briefSummary)
                        .foregroundColor(.white)
                        .bold()
                        .font(.caption)
                        .lineLimit(3)
                        Text("morning")
                            .foregroundColor(.white)
                            .font(.caption)
                            .lineLimit(3)
                    }
                    Spacer()
                    NavigationLink("", isActive: $showBreath, destination: {Breathing()})
                    Button {
                        self.showBreath.toggle()
                    
                    } label: {
                        Text("Start")
                            .padding()
                            .foregroundColor(.indigo)
                            .font(.footnote)
                            
                            
                            
                        
                    }.foregroundColor(.white)
                        .background(Color.white)
                        .cornerRadius(17)
                    
                    
                }
                .padding()
                .background(.indigo)
                
            }
        }
    }
}

struct ExpandableView: View {
    var description: String
    @State var duration: String = "3 min"
    @State var voice: Bool = false
    
    
    @Binding var isShow: Bool
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>

    var body: some View {
        VStack(alignment: .leading){
            Text(self.description)
                .font(.body)
                .foregroundColor(.black)
                .padding(.bottom, 10)
            Spacer()
            HStack{
                Image(systemName: "waveform")
                    .foregroundColor(.indigo)
                Spacer()
                Text("Duration")
                    .bold()
                Spacer()
                ZStack{
                    Menu(duration){
                        Button("3 min"){
                            self.duration = "3 min"

                            
                        }
                                                        
                        Button("5 min"){
                          self.duration = "5 min"
                        }
                        Button("7 min"){
                            self.duration = "7 min"
                            
                        }
                    

                    }.background( Rectangle()
                                    .frame(width:95, height: 50)
                                    .foregroundColor(Color(red: 88/255, green: 86/255, blue: 214/255))
                                    .cornerRadius(15)
                                    .opacity(0.20))
                }
            }.padding()
            HStack{
                Image(systemName: "hourglass")
                    .foregroundColor(.indigo)
                Spacer()
                Text("Voice")
                    .bold()
                Spacer()
                ZStack{
                    Menu(voice ? "Voice" : "No Voice"){
                        Button("Voice"){
                            self.voice = true
                            
                        }
                        Button("No Voice"){
                            self.voice = false
                            
                        }
                }.background( Rectangle()
                                .frame(width:95, height: 50)
                                .foregroundColor(Color(red: 88/255, green: 86/255, blue: 214/255))
                                .cornerRadius(15)
                                .opacity(0.20))
                }
            }.padding()

        }.padding(.all)
            
    }
  

   
}
