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
    var day : String
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
        self.tmp = [Schedule(day: "day 1",
                             nameExercise: "Breathing",
                             nameAudioFile: "Exawer_monday",
                             duration: "7 min",
                             description: "relax during this exercise, slow down "),
                    Schedule(day: "day 2",
                             nameExercise: "Meditation",
                             nameAudioFile: "Exawer_monday",
                             duration: "7 min", description: "a"),
                    Schedule(day: "day 3",
                             nameExercise: "Breathing",
                             nameAudioFile: "Exawer_monday",
                             duration: "7 min", description: "boo"),
                    Schedule(day: "day 4",
                             nameExercise: "Breathing",
                             nameAudioFile: "Exawer_monday",
                             duration: "7 min", description: "boo"),
                    Schedule(day: "day 5",
                             nameExercise: "Meditation",
                             nameAudioFile: "Exawer_monday",
                             duration: "7 min", description: "boo"),
                    Schedule(day: "day 6",
                             nameExercise: "Meditation",
                             nameAudioFile: "Exawer_monday",
                             duration: "7 min", description: "boo")
        ]
        
        
        self.paths.append(
            
            PathData(id : 0,subtitle: NSLocalizedString("Train this power for your exams!", comment: ""), title: "EXAWER", color: "carousel_exawer", description: NSLocalizedString("Are you struggling for your next exam? This is the ideal path for you to stay motivated and focused while taking on your challenge!", comment: ""),
                     week: self.tmp,
                     keywords: ["hurry", "worry", "anxiety", "stress", "exam"]
                ))
        
//        self.tmp.removeAll()
        self.paths.append(
            PathData(id: 1, subtitle: NSLocalizedString("Get ready to become the star of the scene!", comment: ""), title: "RISE AND SHINE", color: "carousel_riseandshine", description: NSLocalizedString("Are you ready to become the star of your presentation? Get comfortable and follow this quick path to gain confidence and steal the spotlight!", comment: ""),
                     week: self.tmp,
                     keywords: ["hurry", "worry", "anxiety", "stress", "exam"]
                )
        
        )
        //            Card_Carousel(id: 2, name: "INNER PARTY", cardColor: "carousel_innerparty", motto: "Train this power for to sit back and relax!"),
        self.paths.append(
            PathData(id: 2, subtitle: NSLocalizedString("Have a relaxing party with your inner self!", comment: ""), title: "INNER PARTY", color: "carousel_innerparty", description: NSLocalizedString("Let's toast to your accomplishments! You've worked hard and now it's time to celebrate, relax and be kind to yourself. Follow this path and relax!", comment: ""),
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
