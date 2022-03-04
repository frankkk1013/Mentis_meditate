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
    var fromPathdetails: Bool
    var color: String
    
    
    //    @Binding var isShow: Bool
    @ObservedObject var progress: UseProgress
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
                       
                        
                        
                        Text(self.title)
                            .font(.system(size: 35, weight: .heavy)).foregroundColor(Color(color)).tracking(0.38).brightness(-0.3).multilineTextAlignment(.center)
                            .lineLimit(3)
                        Spacer()
                    }
                    
                    Spacer()
                }
                .padding()
                
                Spacer()
                
                
                HStack(alignment: .center) {
                    VStack(alignment: .leading){
                        Text(self.briefSummary)
                            .foregroundColor(Color(color))
                            .bold()
                            .font(.subheadline)
                            .lineLimit(3).brightness(-0.5)
                        Text("morning")
                            .foregroundColor(Color(color)).brightness(-0.5)
                            .font(.caption)
                            .lineLimit(3)
                    }
                    Spacer()
                    NavigationLink("", isActive: $showBreath, destination: {
                        VStack{
                            if self.briefSummary.contains("Meditation"){
                                Meditation()
                                
                            }else{
                                Breathing()
                                
                            }
                        }
                    })
                    Button {
                        if (!fromPathdetails){
                            progress.progress[progress.progress.firstIndex{$0.pathName == self.title}!].progresspercent =
                            String(Int(progress.progress[progress.progress.firstIndex{$0.pathName == self.title}!].progresspercent)! + (100/6))
                            progress.progress[progress.progress.firstIndex{$0.pathName == self.title}!].exerciseDone[
                                progress.progress[progress.progress.firstIndex{$0.pathName == self.title}!].exerciseDone.firstIndex{
                                    $0 == "false"}!] = "true"
                            progress.handleUpd(newDeck: progress.progress[progress.progress.firstIndex{$0.pathName == self.title}!])
                        }
                        
                        
                        self.showBreath.toggle()
                        
                    } label: {
                        Text("Start")
                            .padding()
                            .foregroundColor(.indigo)
                            .font(.body)
                        
                        
                        
                        
                    }.foregroundColor(.white)
                        .background(Color.white)
                        .cornerRadius(17)
                    
                    
                }
                .padding()
                .background(Color(color))
                //                .background(Color.black)
                //                .opacity(0.1)
                
                
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
                    .font(.system(size: 15, weight: .medium))
                    .foregroundColor(.gray).brightness(-0.4)
                    .padding(.bottom, 10)
                Spacer()
                HStack{
                    Image(systemName: "hourglass")
                        .foregroundColor(.indigo)
                    
                    Spacer()
                    Text("Duration")
                        .fontWeight(.medium)
                    Spacer()
                    ZStack{
                        Rectangle()
                            .frame(width:95, height: 50)
                            .foregroundColor(Color(red: 88/255, green: 86/255, blue: 214/255))
                            .cornerRadius(15)
                            .opacity(0.20)
                        Menu(duration ){
                            Button("3 min"){
                                self.duration = "3 min   "
                                
                                
                            }
                            
                            Button("5 min"){
                                self.duration = "5 min   "
                            }
                            Button("7 min"){
                                self.duration = "7 min   "
                                
                            }
                            
                        }
                        
                        
                        
                    }
                    
                    .padding(.trailing, 4)
                    
                    
                }.padding()
                
                HStack{
                    Image(systemName: "waveform")
                        .foregroundColor(.indigo)
                    
                    Spacer()
                    Text("Voice   ")
                        .fontWeight(.medium)
                    Spacer()
                    
                    ZStack{
                        Rectangle()
                            .frame(width:95, height: 50)
                            .foregroundColor(Color(red: 88/255, green: 86/255, blue: 214/255))
                            .cornerRadius(15)
                            .opacity(0.20)
                        Menu(voice ? "Voice   " : "No Voice"){
                            Button("Voice"){
                                self.voice = true
                                
                            }
                            Button("No Voice"){
                                self.voice = false
                                
                            }
                            
                        }
                        
                        
                    }
                    
                    .padding(.trailing, 4)
                    //                    }
                    
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
    @State var briefSummary: String
    @State var description : String
    var color: String
    @State var percentage : String
    @State private var showBreath = false
    @State private var showingSheet = false
    @ObservedObject var progress: UseProgress
    
    //    @Binding var isShow: Bool
    
    var body: some View {
        
        VStack(alignment: .center, spacing: 0) {
            
            
            
            HStack {
                //
                VStack(alignment: .leading) {
                    
                    Text(self.title)
                        .font(.system(size: 40, weight: .heavy)).foregroundColor(Color(color)).tracking(0.38).multilineTextAlignment(.center).brightness(-0.3)
                        .lineLimit(3)
                    
                    
                    
                    //EXAWER
                    Spacer()
                    VStack(alignment: .trailing){
                        Text(percentage).font(.system(size: 40, weight: .heavy)).foregroundColor(Color(color)).tracking(0.38).multilineTextAlignment(.center).brightness(-0.3)
                    }
                    
                    
                    
                    
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
                            .font(.subheadline)
                            .lineLimit(3)
                            .brightness(-0.5)
                        Text("morning")
                            .foregroundColor(Color(color))
                            .font(.caption)
                            .lineLimit(3)
                            .brightness(-0.5)
                            
                    }
                    Spacer()
                    NavigationLink("", isActive: $showBreath, destination: {
                        
                        VStack{
                            if self.briefSummary.contains("Meditation"){
                                Meditation().onDisappear{
                                    if (progress.progress.firstIndex{$0.pathName == self.title}) != nil{
                                        if (progress.progress[progress.progress.firstIndex{$0.pathName == self.title}!].exerciseDone.firstIndex{
                                            $0 == "false"}) != nil{
                                            briefSummary = MentisPaths.paths[MentisPaths.paths.firstIndex{$0.title == self.title}!].week[progress.progress[progress.progress.firstIndex{$0.pathName == self.title}!].exerciseDone.firstIndex{
                                                $0 == "false"}!].nameExercise
                                            description = MentisPaths.paths[MentisPaths.paths.firstIndex{$0.title == self.title}!].week[progress.progress[progress.progress.firstIndex{$0.pathName == self.title}!].exerciseDone.firstIndex{
                                                $0 == "false"}!].description
                                            
                                            
                                        }
                                        
                                    }
                                    
                                    
                                }
                                
                            }else{
                                Breathing().onDisappear{
                                    if (progress.progress.firstIndex{$0.pathName == self.title}) != nil{
                                        if (progress.progress[progress.progress.firstIndex{$0.pathName == self.title}!].exerciseDone.firstIndex{
                                            $0 == "false"}) != nil{
                                            briefSummary = MentisPaths.paths[MentisPaths.paths.firstIndex{$0.title == self.title}!].week[progress.progress[progress.progress.firstIndex{$0.pathName == self.title}!].exerciseDone.firstIndex{
                                                $0 == "false"}!].nameExercise
                                            description = MentisPaths.paths[MentisPaths.paths.firstIndex{$0.title == self.title}!].week[progress.progress[progress.progress.firstIndex{$0.pathName == self.title}!].exerciseDone.firstIndex{
                                                $0 == "false"}!].description
                                            
                                            
                                        }
                                        
                                    }
                                }
                                
                                
                            }
                        }})
                    Button {
                        
                        progress.progress[progress.progress.firstIndex{$0.pathName == self.title}!].progresspercent =
                        String(Int(progress.progress[progress.progress.firstIndex{$0.pathName == self.title}!].progresspercent)! + (100/6))
                        progress.progress[progress.progress.firstIndex{$0.pathName == self.title}!].exerciseDone[
                            progress.progress[progress.progress.firstIndex{$0.pathName == self.title}!].exerciseDone.firstIndex{
                                $0 == "false"}!] = "true"
                        progress.handleUpd(newDeck: progress.progress[progress.progress.firstIndex{$0.pathName == self.title}!])
                        self.percentage = progress.progress[progress.progress.firstIndex{$0.pathName == self.title}!].progresspercent
                        self.showBreath.toggle()
                        
                        
                        
                        
                        
                    } label: {
                        Text("Start")
                            .padding()
                            .foregroundColor(.indigo)
                            .font(.body)
                        
                        
                        
                        
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
            SheetViewCard(subtitle: self.subtitle, title: self.title, backgroundImage: self.backgroundImage, briefSummary: self.briefSummary, description: self.description, fromPathdetails: false,color: color, progress: progress )
            
        }
        
        
        
        
    }
}


//
//struct CardSheet: View {
//    @ObservedObject var progress: UseProgress
//    var body: some View {
//        VStack{
//            TopCard(subtitle: "hello", title: "EXAWER", backgroundImage: Image("luna"), briefSummary: "5 SENSE DRILL", description: "You're preparing for the exam, and our nerves are running high. This morning meditation exercise using the five senses is a great way to keep your emotions under control.", color : "indigo", percentage: "", progress: progress )
//        }
//
//    }
//}
//
//struct CardSheet_Previews: PreviewProvider {
//    static var previews: some View {
//        CardSheet()
//    }
//}
