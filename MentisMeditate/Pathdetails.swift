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
    var color: Color
    var body: some View {
        HStack {
            //Rectangle 34
            RoundedRectangle(cornerRadius: 8)
                .fill(color)
                .frame(width: 34, height: 34)
            VStack(alignment: .leading) {
                Text(self.text).font(.system(size: 14, weight: .medium)).tracking(0.38).foregroundColor(.gray).brightness(-0.4)
                Text(day).font(.system(size: 12, weight: .light)).tracking(0.38).foregroundColor(.gray).brightness(-0.4)
            }
            Spacer()
            Image(systemName: "chevron.right").foregroundColor(.gray)
            
        }
    }
}

struct Pathdetails: View {
    @Binding var tabSelection : Int
    var id : Int
    var tapped : Bool = false
    @State var showingSheet = false
    @ObservedObject var progress: UseProgress
    @State var sheetToView : SheetViewCard = SheetViewCard(subtitle: "", title: "", backgroundImage: Image(systemName: "is"), briefSummary: "", description: "", fromPathdetails: false, color: "", progress: UseProgress())
    
    
    var body: some View {
        ScrollView{
            VStack {
                
                Image(MentisPaths.paths[id].title)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                
                
                //            .clipped()
                
                    .edgesIgnoringSafeArea(.top)
                HStack{
                    //EXAWER
                    Text(MentisPaths.paths[id].title).font(.system(size: 36, weight: .bold)).foregroundColor(Color(MentisPaths.paths[id].title)).tracking(0.36)
                    Spacer()
                    Button {
                        //                    self.showBreath.toggle()
                        progress.createProgress(pathName: MentisPaths.paths[id].title)
                        tabSelection = 1
                        
                    } label: {
                        Text("Add")
                        
                            .foregroundColor(.white)
                            .font(.body).fontWeight(.medium)
                            .padding()
                        
                        
                        
                        
                    }.foregroundColor(.white)
                        .background(Color(MentisPaths.paths[id].title).opacity(1))
                        .cornerRadius(16)
                }.edgesIgnoringSafeArea(.top)
                    .padding(.trailing)
                    .padding(.leading)
                
                Text(MentisPaths.paths[id].description).font(.system(size: 14, weight: .medium)).padding()
                    .foregroundColor(Color.gray).brightness(-0.4)
                Divider()
                
                //                List{
                ForEach(MentisPaths.paths[id].week, id: \.self.id){ it in
                    VStack(alignment: .leading){
                        
                        ItemRow(text: it.nameExercise, day: it.day, color: Color(MentisPaths.paths[id].title)).contentShape(Rectangle())
                            .onTapGesture {
                            sheetToView = SheetViewCard(subtitle: "idk", title: MentisPaths.paths[id].title, backgroundImage: Image(MentisPaths.paths[id].title), briefSummary: it.nameExercise, description: it.description,fromPathdetails: true, color: MentisPaths.paths[id].title, progress: progress)
                            showingSheet.toggle()
                            
                        }
                            
                        Divider()
                    }.padding(.leading)
                        .padding(.trailing)
                        
                    
                    
                    
                    
                }
                NavigationLink("", destination: sheetToView , isActive: $showingSheet)
                
                
                
                //                }.background(.white)
                
            }.navigationBarTitleDisplayMode(.inline)
                .navigationBarBackButtonHidden(false)
        }//        .sheet(isPresented: $showingSheet){
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
