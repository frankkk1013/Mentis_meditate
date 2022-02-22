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
            
            ScrollView{
                VStack(alignment:.leading){
                    
                    
                    CardView(subtitle: "hello", title: "MOTIVATION", backgroundImage: Image("Rise"), briefSummary: "5 SENSE DRILL", description: "Motivate yourself thanks to this exercise ")
                        .environmentObject(self.control).padding()
                    
                    CardView(subtitle: "hello", title: "EXAWER", backgroundImage: Image("luna"), briefSummary: "5 SENSE DRILL", description: "You're preparing for the exam, and our nerves are running high. This morning meditation exercise using the five senses is a great way to keep your emotions under control.")
                        .environmentObject(self.control).padding()
                    NavigationLink("", isActive: $showNew, destination: { SnapCarousel().navigationBarHidden(true)}
                        
                    )
                    
                }.onAppear{
                    self.title = "Journey"
                    self.isJourneyShow = true
                   
                    self.control.anyTriggered = false
                    
                    
                    
                }.ignoresSafeArea()
                
                
            }.tabItem {
                Image(systemName: "leaf.fill")
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
                Text("Progress")
            }
            
            
            
        }
        .accentColor(Color(red: 88/255, green: 86/255, blue: 214/255))
        
        .navigationTitle(title)
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(!self.control.anyTriggered)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing ){
                if isJourneyShow && !control.anyTriggered {
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
    
}

struct TopMenu: View {
    @Binding var isProfileShow: Bool
    
    var body: some View {
        VStack(alignment: .leading) {
            //            Text("WED, JULY 31")
            //                .font(.caption)
            //                .padding(.bottom, -10)
            //                .foregroundColor(.gray)
            
            HStack(alignment: .center) {
                Text("Journey")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Spacer()
                
                Button(action: { self.isProfileShow.toggle() }) {
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
