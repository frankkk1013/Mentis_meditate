//
//  Journey.swift
//  MentisMeditate
//
//  Created by Francesco Iaccarino on 15/02/22.
//

import SwiftUI

struct Journey: View {
    @State var isJourneyShow = false
    @State var counter: CGFloat = 0;
    @ObservedObject var control = CardView_Control()
    @State private var showNew = false
    @State var title : String = ""
    
    
    
    var body: some View {
        
        TabView{
            SnapCarousel().onAppear{
                
                
                
            }
                .tabItem{
                Image(systemName: "seal")
                        .onTapGesture {
                    self.title = "Choose your Power"
                }
                Text("Carousel")
                
                }
            
            ScrollView{
                VStack(alignment:.leading){
                    
                    
                    TopCard(subtitle: "hello", title: "MOTIVATION", backgroundImage: Image("Rise"), briefSummary: "5 SENSE DRILL", description: "Motivate yourself thanks to this exercise ")
                        
                    
                    TopCard(subtitle: "hello", title: "EXAWER", backgroundImage: Image("luna"), briefSummary: "5 SENSE DRILL", description: "You're preparing for the exam, and our nerves are running high. This morning meditation exercise using the five senses is a great way to keep your emotions under control.")
                        
                    NavigationLink("", isActive: $showNew, destination: { SnapCarousel().navigationBarHidden(true)}
                        
                    )
                    
                }.onAppear{
                    self.title = "Journey"
                    self.isJourneyShow = true
                   
                    self.control.anyTriggered = false
                    
                    
                    
                }.ignoresSafeArea()
                
                
            }.tabItem {
                Image(systemName: "leaf.fill").onTapGesture {
                    self.title = "Journey"
                }
                Text("Journey")
            }
            
            
            
            //            NavigationView{
            Background_music().onAppear{
                self.title = "Playlist"
                self.isJourneyShow = false
                self.control.anyTriggered = true
                
                
                
            }
            
            //            }
            .tabItem {
                Image(systemName: "headphones")
                    .onTapGesture {
                    self.title = "Playlist"
                }
                Text("Sounds")
            }
            
            //            NavigationView{
            Progress().onAppear{
                self.title = "Progress"
                self.isJourneyShow = false
                self.control.anyTriggered = true
                
                
            }
            
            //            }
            .tabItem {
                Image(systemName: "scale.3d")
                    .onTapGesture {
                    self.title = "Progress"
                
                }
                Text("Progress")
            }
            
            
            
            
        }
        .accentColor(Color(red: 88/255, green: 86/255, blue: 214/255))
        
        .navigationTitle(title)
        .navigationBarBackButtonHidden(true)
//        .navigationBarHidden(self.control.anyTriggered)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing ){
                Button{
                    self.showNew.toggle()
                    
                    
                }label:{
                    Image(systemName: "gyroscope")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundColor(.indigo)
                }
                
                
                
                
            }
        }
        
    }
    
}




struct Journey_Previews: PreviewProvider {
    static var previews: some View {
        Journey()
    }
}
