//
//  CardSheet.swift
//  MentisMeditate
//
//  Created by Francesco Iaccarino on 22/02/22.
//

import SwiftUI
struct SheetViewCard: View {
    var subtitle: String
    var title: String
    var backgroundImage: Image
    var briefSummary: String
    var description: String
    
//    @Binding var isShow: Bool
    @State private var translation = CGSize.zero
    @State private var showBreath = false
    @State var duration: String = "3 min"
    @State var voice: Bool = false
    @Environment(\.dismiss) var dismiss


    var body: some View {
        VStack{
            VStack(alignment: .center, spacing: 0) {
               
                
                
                HStack {
                    VStack(alignment: .leading) {
                        Spacer()

                        
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
            .background(
                self.backgroundImage
                    .resizable()
                    
                    .scaledToFit()
                    
                    .aspectRatio(contentMode: .fill)
                    
                    .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
                    .opacity(0.8)
                    
            )
            
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
                            Button("3 min "){
                                self.duration = "3 min "

                                
                            }
                                                            
                            Button("5 min "){
                              self.duration = "5 min "
                            }
                            Button("7 min "){
                                self.duration = "7 min "
                                
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
                            Button("   Voice"){
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
                Spacer()

            }.padding(.all)
            Spacer()
        }
        
    }
}

struct TopCard: View {
    var subtitle: String
    var title: String
    var backgroundImage: Image
    var briefSummary: String
    var description : String
    var color: String
    @State var percentage : String
    @State private var showBreath = false
    @State private var showingSheet = false
    
//    @Binding var isShow: Bool
    
    var body: some View {
        
            VStack(alignment: .center, spacing: 0) {
               
                
                
                HStack {
//
                    VStack(alignment: .leading) {
                        
                        
                        Text(percentage).font(.system(size: 40, weight: .heavy)).foregroundColor(Color(color)).tracking(0.38).multilineTextAlignment(.center)
                            .colorInvert()

                        //EXAWER
                        Spacer()

                        
                        Text(self.title)
                            .font(.system(size: 40, weight: .heavy)).foregroundColor(Color(color)).tracking(0.38).multilineTextAlignment(.center)
                            .lineLimit(3).colorInvert()
                    }
                    
                    Spacer()
                }
                .padding()
                
                
                Spacer()
                
                ZStack{
                    HStack(alignment: .center) {
                        VStack(alignment: .leading){
                        Text(self.briefSummary)
                                .foregroundColor(Color(color))
                            .bold()
                            .font(.caption)
                            .lineLimit(3)
                            .colorInvert().opacity(1)
                            Text("morning")
                                .foregroundColor(Color(color))
                                .font(.caption)
                                .lineLimit(3)
                                .colorInvert()
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
                    .background(Color(color))
                    
                        
                    
                    
                }.background(RoundedRectangle(cornerRadius: 30, style: .continuous).colorInvert())
                
                
            }
            .frame(width: UIScreen.main.bounds.width - 40)
            .frame(height: 300) //300
            .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous)).opacity(8)
            .background(
                self.backgroundImage
                    .resizable()
                    .scaledToFill()
                    
                    .frame(height: 300) //300
                    
                    
                    .frame(width: UIScreen.main.bounds.width - 40)
                    
                    
                    .aspectRatio(contentMode: .fill)
                   
                    
                    
                    .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
                    .opacity(0.8)
                    
            )
            .onTapGesture {
                showingSheet.toggle()
            }.sheet(isPresented: $showingSheet){
                SheetViewCard(subtitle: self.subtitle, title: self.title, backgroundImage: self.backgroundImage, briefSummary: self.briefSummary, description: self.description)
                    
            }
            
            
            
        
    }
}



struct CardSheet: View {
    var body: some View {
        VStack{
            TopCard(subtitle: "hello", title: "EXAWER", backgroundImage: Image("luna"), briefSummary: "5 SENSE DRILL", description: "You're preparing for the exam, and our nerves are running high. This morning meditation exercise using the five senses is a great way to keep your emotions under control.", color : "indigo", percentage: "")
        }
        
    }
}

struct CardSheet_Previews: PreviewProvider {
    static var previews: some View {
        CardSheet()
    }
}
