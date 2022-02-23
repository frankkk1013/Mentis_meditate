//
//  PathsInfo.swift
//  MentisMeditate
//
//  Created by Francesco Iaccarino on 22/02/22.
//

import SwiftUI

enum days {
    case monday, tuesday, wednesday, thursday, friday, saturday, sunday
}

struct Schedule{
    var id = UUID()
    var day : days
    var nameExercise : String
    var nameAudioFile : String
    var duration : String
    var description: String
}

struct PathData{
    
    var id: Int
    var subtitle : String
    var title : String
    var color : String
    var description : String
    var week : [Schedule]
    var keywords : [String]
    
}

struct Paths {
    var paths : [PathData] = []
    var tmp : [Schedule]
    
    init(){
        self.tmp = [Schedule(day: days.monday,
                             nameExercise: "Meditation",
                             nameAudioFile: "Exawer_monday",
                             duration: "7 min",
                             description: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"),
                    Schedule(day: days.tuesday,
                             nameExercise: "Meditation",
                             nameAudioFile: "Exawer_monday",
                             duration: "7 min", description: "boo"),
                    Schedule(day: days.wednesday,
                             nameExercise: "Meditation",
                             nameAudioFile: "Exawer_monday",
                             duration: "7 min", description: "boo"),
                    Schedule(day: days.thursday,
                             nameExercise: "Meditation",
                             nameAudioFile: "Exawer_monday",
                             duration: "7 min", description: "boo"),
                    Schedule(day: days.friday,
                             nameExercise: "Meditation",
                             nameAudioFile: "Exawer_monday",
                             duration: "7 min", description: "boo"),
                    Schedule(day: days.saturday,
                             nameExercise: "Meditation",
                             nameAudioFile: "Exawer_monday",
                             duration: "7 min", description: "boo"),
                    Schedule(day: days.sunday,
                             nameExercise: "Meditation",
                             nameAudioFile: "Exawer_monday",
                             duration: "7 min", description: "boo")]
        
        
        self.paths.append(
            
            PathData(id : 0,subtitle: "Train this power for your exams!", title: "EXAWER", color: "carousel_exawer", description: "You're preparing for the exam, and our nerves are running high. This morning meditation exercise using the five senses is a great way to keep your emotions under control.",
                     week: self.tmp,
                     keywords: ["hurry", "worry", "anxiety", "stress", "exam"]
                ))
        
        self.tmp.removeAll()
        self.paths.append(
            PathData(id: 1, subtitle: "Train this power for the perfect presentation!", title: "RISE AND SHINE", color: "carousel_riseandshine", description: "You're preparing for the exam, and our nerves are running high. This morning meditation exercise using the five senses is a great way to keep your emotions under control.",
                     week: self.tmp,
                     keywords: ["hurry", "worry", "anxiety", "stress", "exam"]
                )
        
        )
        //            Card_Carousel(id: 2, name: "INNER PARTY", cardColor: "carousel_innerparty", motto: "Train this power for to sit back and relax!"),
        self.paths.append(
            PathData(id: 2, subtitle: "Train this power for to sit back and relax!", title: "INNER PARTY", color: "carousel_innerparty", description: "You're preparing for the exam, and our nerves are running high. This morning meditation exercise using the five senses is a great way to keep your emotions under control.",
                     week: self.tmp,
                     keywords: ["hurry", "worry", "anxiety", "stress", "exam"]
                )
        
        )
        
    }
    
}


struct PathsInfo: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct PathsInfo_Previews: PreviewProvider {
    static var previews: some View {
        PathsInfo()
    }
}
