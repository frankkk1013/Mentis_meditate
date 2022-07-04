//
//  CardSheet.swift
//  MentisMeditate
//
//  Created by Francesco Iaccarino on 22/02/22.
//

import SwiftUI

public class SheetState: ObservableObject {
    @Published var activeCard: Bool = false
    @Published var screen: String = ""
    @Published var voice: Bool = true
    @Published var minutes: String = ""
    @Published var text: [String] = [ ""]
    
}



struct SheetViewCard: View {
    var subtitle: String
    var title: String
    var backgroundImage: Image
    var briefSummary: String
    var description: String
    var fromPathdetails: Bool
    var color: String
    var titleExercise: String
    @State var text: [String] = []
    
    
    
    //    @Binding var isShow: Bool
    @ObservedObject var progress: UseProgress
    @EnvironmentObject var stateSheet: SheetState
    @State private var translation = CGSize.zero
    @State private var showBreath = false
    @State var duration: String
    @State var voiceAvailabilty: [Bool] = [false, false, false]
    @State var voice: Bool = false
    @Environment(\.dismiss) var dismiss
    @Environment(\.presentationMode) var presentationMode
    
    
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
                        Text(self.titleExercise)
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
                                Meditation(duration: duration, voice: voice, title: self.titleExercise, text:
                                            
                               text)
                                
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
                            
                            stateSheet.voice = self.voice
                            stateSheet.minutes = self.duration
                            stateSheet.screen = self.briefSummary
                            stateSheet.activeCard = true
                            presentationMode.wrappedValue.dismiss()
                            if NSLocalizedString("eng", comment: "").contains("eng"){
                                stateSheet.text = MentisPaths.paths[MentisPaths.paths.firstIndex{$0.title == self.title}!].week[MentisPaths.paths[MentisPaths.paths.firstIndex{$0.title == self.title}!].week.firstIndex{$0.title == self.titleExercise}!].text_eng
                               
                                
                            }else{
                                stateSheet.text = MentisPaths.paths[MentisPaths.paths.firstIndex{$0.title == self.title}!].week[MentisPaths.paths[MentisPaths.paths.firstIndex{$0.title == self.title}!].week.firstIndex{$0.title == self.titleExercise}!].text_ita
                                
                            }
                        }else{
                            if NSLocalizedString("eng", comment: "").contains("eng"){
                                text = MentisPaths.paths[MentisPaths.paths.firstIndex{$0.title == self.title}!].week[MentisPaths.paths[MentisPaths.paths.firstIndex{$0.title == self.title}!].week.firstIndex{$0.title == self.titleExercise}!].text_eng
                               
                                
                            }else{
                                text = MentisPaths.paths[MentisPaths.paths.firstIndex{$0.title == self.title}!].week[MentisPaths.paths[MentisPaths.paths.firstIndex{$0.title == self.title}!].week.firstIndex{$0.title == self.titleExercise}!].text_ita
                                
                            }
                        }
                       
                        
                        
                        self.showBreath.toggle()
                        
                    } label: {
                        Text("Start")
                            .padding()
                            .foregroundColor(.indigo)
                            .font(.body)
                        
                        
                        
                        
                    }.foregroundColor(.white)
                        .background(Color.white)
                        .cornerRadius(17).frame(width:95, height: 50)
                    
                    
                    
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
                        .font(.title)
                    
                    Spacer()
                    Text("Duration")
                        .fontWeight(.medium)
                    Spacer()
                    if self.briefSummary.contains("Meditation"){
                        ZStack{
                            Rectangle()
                                .frame(width:95, height: 50)
                                .foregroundColor(Color(red: 88/255, green: 86/255, blue: 214/255))
                                .cornerRadius(15)
                                .opacity(0.20)
                            Menu(duration ){
                               
                                Button("3 min"){
                                    self.duration = "3 min"
                                }
                                
                                Button("5 min"){
                                    self.duration = "5 min"
                                }
                                Button("7 min"){
                                    self.duration = "7 min"
                                    
                                }
                                
                            }.foregroundColor(.indigo).brightness(-0.5)
                            
                            
                            
                        }
                        
                        .padding(.trailing, 4)
                        
                        
                    }else{
                        ZStack{
                            Rectangle()
                                .frame(width:95, height: 50)
                                .foregroundColor(Color(red: 88/255, green: 86/255, blue: 214/255))
                                .cornerRadius(15)
                                .opacity(0.20)
                            Text("3 min")
                                .font(.body).bold()
                                .foregroundColor(.gray)
                        }
                        
                    }
                    
                    
                }.padding()
                
                if self.briefSummary.contains("Meditation"){
                    HStack{
                        Image(systemName: "waveform")
                            .foregroundColor(.indigo)
                        
                        Spacer()
                        Text("Voice")
                            .fontWeight(.medium)
                        Spacer()
                        
                        ZStack{
                            Rectangle()
                                .frame(width:95, height: 50)
                                .foregroundColor(Color(red: 88/255, green: 86/255, blue: 214/255))
                                .cornerRadius(15)
                                .opacity(0.20)
                            Menu(voice ? "Voice" : "No Voice"){
                                Button("Voice"){
                                    self.voice = true
                                    
                                }
                                Button("No Voice"){
                                    self.voice = false
                                    
                                }
                                
                            }.foregroundColor(.indigo).brightness(-0.5)
                            
                            
                        }
                        
                        .padding(.trailing, 4)
                        //                    }
                        
                    }.padding()
                    
                }
                
                
                
                Spacer()
                
            }.padding(.all)
            Spacer()
        }.onAppear{
            if Bundle.main.path(forResource:"\(title) eng 3min", ofType: "m4a") != nil {
                voiceAvailabilty[0] = true
                
            }
            if Bundle.main.path(forResource:"\(title) eng 5min", ofType: "m4a") != nil {
                voiceAvailabilty[1] = true
                
            }
            if Bundle.main.path(forResource:"\(title) eng 7min", ofType: "m4a") != nil {
                voiceAvailabilty[2] = true
                
            }
        }
        
    }
    
    
}

struct TopCard: View {
    var subtitle: String
    var title: String
    var backgroundImage: Image
    @State var duration: String
    @State var briefSummary: String
    @State var description : String
    @State var stateSheet : SheetState = SheetState()
    var color: String
    var titleExercise: String
    @State var voice : Bool = true
    @State var percentage : String
    @State private var showBreath = false
    @State private var showingSheet = false
    @ObservedObject var progress: UseProgress
    @State var text: [String] = [""]
    
//    @State private var showSecondScreen = false
    
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
                        Text(self.titleExercise)
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
                                Meditation(duration: duration, voice : voice, title: self.titleExercise, text: text).onDisappear{
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
                        
                        if NSLocalizedString("eng", comment: "").contains("eng"){
                            text = MentisPaths.paths[MentisPaths.paths.firstIndex{$0.title == self.title}!].week[MentisPaths.paths[MentisPaths.paths.firstIndex{$0.title == self.title}!].week.firstIndex{$0.title == self.titleExercise}!].text_eng
                            
                        }else{
                            text = MentisPaths.paths[MentisPaths.paths.firstIndex{$0.title == self.title}!].week[MentisPaths.paths[MentisPaths.paths.firstIndex{$0.title == self.title}!].week.firstIndex{$0.title == self.titleExercise}!].text_ita
                            
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
        }.sheet(isPresented: $showingSheet, onDismiss: {
            if stateSheet.activeCard{
                self.voice = stateSheet.voice
                self.briefSummary = stateSheet.screen
                self.duration = stateSheet.minutes
                stateSheet.activeCard = false
                self.percentage = progress.progress[progress.progress.firstIndex{$0.pathName == self.title}!].progresspercent
                self.showBreath.toggle()
                self.text = stateSheet.text
                
            }
        }){
            SheetViewCard(subtitle: self.subtitle, title: self.title, backgroundImage: self.backgroundImage, briefSummary: self.briefSummary, description: self.description, fromPathdetails: false,color: color, titleExercise: self.titleExercise, progress: progress , duration: duration).environmentObject(stateSheet)
            
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
