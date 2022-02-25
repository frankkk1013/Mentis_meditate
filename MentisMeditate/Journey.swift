//
//  Journey.swift
//  MentisMeditate
//
//  Created by Francesco Iaccarino on 15/02/22.
//

import SwiftUI
import simd

struct Journey: View {
    @State var isJourneyShow = false
    @State var counter: CGFloat = 0;
    @ObservedObject var control = CardView_Control()
    @State private var showNew = false
    @State var title : String = ""
    @ObservedObject var progress: UseProgress
    @State var paths: [String] = []
    
    @State var id: [Int] = []
    
    
    
    var body: some View {
        
        TabView{
            NavigationView{
                SnapCarousel(progress: progress).navigationTitle("Choose your Power")
            }
            
            .tabItem{
                Image(systemName: "seal")
                Text("Powers")
            }
            
            NavigationView{
                ScrollView{
                    VStack(alignment:.leading){
                        ForEach(id, id: \.self){ index in
                            TopCard(subtitle: MentisPaths.paths[index].subtitle, title: MentisPaths.paths[index].title, backgroundImage: Image(MentisPaths.paths[index].title), briefSummary: "5 SENSE DRILL", description: "", color: MentisPaths.paths[index].color, percentage: progress.progress[progress.progress.firstIndex{$0.pathName == MentisPaths.paths[index].title}!].progresspercent )
                            
                        }
                        
                        
                        
                        
                        //                        TopCard(subtitle: "hello", title: "MOTIVATION", backgroundImage: Image("Rise"), briefSummary: "5 SENSE DRILL", description: "Motivate yourself thanks to this exercise ")
                        //
                        //
                        //                        TopCard(subtitle: "hello", title: "EXAWER", backgroundImage: Image("luna"), briefSummary: "5 SENSE DRILL", description: "You're preparing for the exam, and our nerves are running high. This morning meditation exercise using the five senses is a great way to keep your emotions under control.")
                        //
                        //                        NavigationLink("", isActive: $showNew, destination: { SnapCarousel().navigationBarHidden(true)}
                        
                        
                        
                    }.ignoresSafeArea()
                    
                    
                }.navigationTitle("Journey")
                    .onAppear{
                        paths.removeAll()
                        id.removeAll()
                        progress.progress.forEach { prog in
                            paths.append(prog.pathName)
                        }
                        paths.forEach { path in
                            id.append(MentisPaths.paths.firstIndex{$0.title == path}!)
                        }
                        
                        
                        
                        print(id)
                        
                        
                    }
            }
            
            .tabItem {
                VStack{
                    Image(systemName: "leaf.fill")
                    Text("Journey")
                    
                }
                
            }
            
            
            
            NavigationView{
                Background_music().navigationTitle("Sounds")
                
            }
            .tabItem {
                Image(systemName: "headphones")
                
                Text("Sounds")
            }
            
            //            NavigationView{
            //                Progress().navigationTitle("Progress")
            //
            //            }
            //            .tabItem {
            //                Image(systemName: "scale.3d")
            //
            //                Text("Progress")
            //            }
            
            
            
            
        }
        .accentColor(Color(red: 88/255, green: 86/255, blue: 214/255))
        
        
        
        
        //        .navigationBarHidden(self.control.anyTriggered)
        //        .toolbar {
        //            ToolbarItem(placement: .navigationBarTrailing ){
        //                Button{
        //                    self.showNew.toggle()
        //
        //
        //                }label:{
        //                    Image(systemName: "gyroscope")
        //                        .resizable()
        //                        .frame(width: 30, height: 30)
        //                        .foregroundColor(.indigo)
        //                }
        //
        //
        //
        //
        //            }
        //        }
        
    }
    
}



//
//struct Journey_Previews: PreviewProvider {
//    static var previews: some View {
//        Journey()
//    }
//}
