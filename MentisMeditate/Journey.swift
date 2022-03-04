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
    @StateObject var progress: UseProgress
    @State var paths: [String] = []
    @State var tabSelection = 0
    @State var id: [Int] = []
    @State var selection: Int = 0
    
    
    
    
    var body: some View {
        
        TabView(selection: $tabSelection){
            NavigationView{
                SnapCarousel(progress: progress, tabSelection: $tabSelection).navigationTitle(Text("Choose your Power"))
                
            }
            
            .tabItem{
                Image(systemName: "gyroscope")
                Text("Powers")
            }.tag(0)
            
            NavigationView{
                ScrollView{
                    VStack(alignment:.leading){
                        
                        ForEach(id, id: \.self){ index in
                            if progress.progress[progress.progress.firstIndex{$0.pathName == MentisPaths.paths[index].title}!].exerciseDone.firstIndex(of:"false" ) != nil
                            {
                                TopCard(subtitle: MentisPaths.paths[index].subtitle, title: MentisPaths.paths[index].title, backgroundImage: Image(MentisPaths.paths[index].title),
                                        briefSummary:MentisPaths.paths[index].week[progress.progress[progress.progress.firstIndex{$0.pathName == MentisPaths.paths[index].title}!].exerciseDone.firstIndex(of:"false" )!].nameExercise ,
                                        description: MentisPaths.paths[index].week[progress.progress[progress.progress.firstIndex{$0.pathName == MentisPaths.paths[index].title}!].exerciseDone.firstIndex(of: "false")!].description, color: MentisPaths.paths[index].color,
                                        percentage: progress.progress[progress.progress.firstIndex{$0.pathName == MentisPaths.paths[index].title}!].progresspercent , progress: progress)
                                    .onDisappear{
                                        
                                        //controlla
                                        if (progress.progress.firstIndex{$0.pathName == MentisPaths.paths[index].title}) != nil{
                                            if progress.progress[progress.progress.firstIndex{$0.pathName == MentisPaths.paths[index].title}!].exerciseDone.firstIndex(of:"false" ) == nil{
                                            progress.handleDel(newDeck: progress.progress[progress.progress.firstIndex{$0.pathName == MentisPaths.paths[index].title}!])
                                            }
        
                                            
                                        }
                                        
                                        
                                        
                                }
                            }
                            
                            
                            
                            
                            
                               
                               
                            
                            
                               
                            
                        }
                        
                        
                        
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
                
            }.tag(1)
            
            
            
            NavigationView{
                Background_music().navigationTitle("Sounds")
                
            }
            .tabItem {
                
                Image(systemName: "headphones")
                
                Text("Sounds")
            }.tag(2)
            
          
            
            
            
            
        }
//        .padding(.top)
            .accentColor(Color(red: 88/255, green: 86/255, blue: 214/255))
            .edgesIgnoringSafeArea(.top)
            .onAppear{
                UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.darkGray]

                //Use this if NavigationBarTitle is with displayMode = .inline
                UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.gray]
            }
            
        
    }
    
}



//
//struct Journey_Previews: PreviewProvider {
//    static var previews: some View {
//        Journey()
//    }
//}
