//
//  Journey.swift
//  MentisMeditate
//
//  Created by Francesco Iaccarino on 15/02/22.
//

import SwiftUI

struct Journey: View {
    @State var isProfileShow = false
    @State var counter: CGFloat = 0;
    @ObservedObject var control = CardView_Control()
    
    
    var body: some View {
        //        NavigationView {
        
        
        VStack{
            TabView{
                
                ScrollView{
                    TopMenu(isProfileShow: $isProfileShow)
                        .padding()
                        .padding(.bottom, -10)
                    
                    VStack(alignment:.leading){
                        CardView(subtitle: "hello", title: "prova", backgroundImage: Image("Image"), briefSummary: "idk", description: "boh")
                            .environmentObject(self.control)
                        
                    }.padding()
                }.tabItem {
                    Image(systemName: "leaf.fill")
                    Text("Home")
                }
                
                
                Background_music().tabItem {
                    Image(systemName: "headphones")
                    Text("Sounds")
                }
                //                    Text("Background Music")
                //                        .font(.system(size: 30, weight: .bold, design: .rounded))
                
                
                Text("Stati")
                    .font(.system(size: 30, weight: .bold, design: .rounded))
                    .tabItem {
                        Image(systemName: "scale.3d")
                        Text("Statistics")
                    }
                
                
                
                
            }
            
            //            TabView{
            //
            //            }
        }
        
        
        
        
        
        
        
        
        
        //            .navigationBarHidden(control.anyTriggered)
        //                .navigationBarTitle("") //Set title to none so that it won't put the bottom title
        //                .navigationBarItems(leading:
        //                                        //This is your made up title, put in the leading view so it is up top aligned with the plus button
        //                                    Text("Journey").font(.largeTitle).bold()
        //                                    //This is the plus button, on the right side, aka trailing view
        //                                    , trailing: Button(action: {
        //
        //                }, label: {
        //                    Image(systemName: "gyroscope").foregroundColor(.indigo)
        //                })
        //                )
        
        //Aggiungere TAB
    }
    //    }
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
