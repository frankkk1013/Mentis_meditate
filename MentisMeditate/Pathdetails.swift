//
//  Pathdetails.swift
//  MentisMeditate
//
//  Created by Francesco Iaccarino on 22/02/22.
//

import SwiftUI

struct ItemRow : View{
   
    var text: String
    var day: String
    var body: some View {
        HStack {
            //Rectangle 34
            RoundedRectangle(cornerRadius: 8)
                .fill(Color(#colorLiteral(red: 0.22397568821907043, green: 0.4468545913696289, blue: 0.5541666746139526, alpha: 1)))
            .frame(width: 34, height: 34)
            VStack(alignment: .leading) {
                Text(self.text).font(.system(size: 12, weight: .bold)).tracking(0.38)
                Text(day).font(.system(size: 11, weight: .light)).tracking(0.38)
               }
            
        }
    }
}

struct Pathdetails: View {
    var id : Int
    var tapped : Bool = false
    @State var showingSheet = false
    @ObservedObject var progress: UseProgress
    
    var body: some View {
        VStack {
        
            Image(MentisPaths.paths[id].title)
            .resizable()
            .aspectRatio(contentMode: .fill)
            
            
//            .clipped()
            
            .edgesIgnoringSafeArea(.top)
            HStack{
                //EXAWER
                Text(MentisPaths.paths[id].title).font(.system(size: 36, weight: .bold)).foregroundColor(Color(#colorLiteral(red: 0.23, green: 0.45, blue: 0.56, alpha: 1))).tracking(0.36)
                Spacer()
                Button {
//                    self.showBreath.toggle()
                    progress.createProgress(pathName: MentisPaths.paths[id].title)
                
                } label: {
                    Text("Add")
                        
                        .foregroundColor(.white)
                        .font(.title3)
                        .padding()
                        
                        
                        
                    
                }.foregroundColor(.white)
                    .background(Color(#colorLiteral(red: 0.23, green: 0.45, blue: 0.56, alpha: 1)))
                    .cornerRadius(16)
            }.edgesIgnoringSafeArea(.top)
                .padding(.trailing)
                .padding(.leading)
            
            Text(MentisPaths.paths[id].description).font(.system(size: 14, weight: .medium)).padding()
            
            List{
                ForEach(MentisPaths.paths[id].week, id: \.self.id){ it in
                    NavigationLink(destination:
                                    SheetViewCard(subtitle: "idk", title: MentisPaths.paths[id].title, backgroundImage: Image(MentisPaths.paths[id].title), briefSummary: it.nameExercise, description: it.description), isActive: $showingSheet ){
                        ItemRow( text: it.nameExercise, day: it.day).onTapGesture {
                            showingSheet.toggle()
                        }
                    }
               
                
                    
                }
                
                
                
            }.background(.white)
            
        }.navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(false)
//        .sheet(isPresented: $showingSheet){
//
//
//        }
       
        
        
    }
}

//struct Pathdetails_Previews: PreviewProvider {
//    static var previews: some View {
//        Pathdetails(id: 0)
//    }
//}
