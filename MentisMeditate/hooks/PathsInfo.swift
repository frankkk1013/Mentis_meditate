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
    var title: String
    var nameAudioFile : String
    var duration : String
    var description: String
    var text: [String]
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
                             nameExercise: "Meditation",
                             title: "5 SENSES DRILL", nameAudioFile: "Exawer_monday",
                             duration: "3 min",
                             description: "You're preparing for the exam, and YOUR nerves are running high. This morning meditation exercise using the five senses is a great way to keep your emotions under control. ",
                            text: ["When you’re feeling an overwhelming emotion, it can completely capture you",
                                   " And when you notice you’re feeling overwhelmed,  this exercise allows you to bring yourself to the here and now.",
                                   " So leave the eyes open"   ,  "and notice five things you can see around you. When you see them,"," you can name them out loud or silently in your head. ","Take some time to visualize each of them.",
                                   "Then, notice four thing you can feel","the texture of your clothing, the smooth surface of the table you’re resting your hands on."," Name them out loud or silently in your head and rest your attention with each sensation for a few deep breaths.",
                                   "Now, name three things you can hear. It can be anything you hear in the background - the birds chirping, some people chatting outside.",
                                   "Then, note two things you can smell. If you can’t seem to smell two things, try to bring attention to scents you usually filter out, even the unpleasant ones.",
                                  " Finally, name one thing you can taste. It can be the leftover taste of a meal, your toothpaste or take a sip of a drink to focus on a taste."
]
                            
                            
                            
                            
                            ),
                    Schedule(day: "day 2",
                             nameExercise: "Meditation",
                             title : "ENHANCED FOCUS", nameAudioFile: "Exawer_monday",
                             duration: "3 min", description: "Meditation can help you sharpen your concentration even if you’re feeling under pressure. Start this exercise to increase your focus as you’re approaching your tasks of the day.",
                            text: ["listen to this session in a safe area where you can sit or lay down"]
                             





                            ),
                    Schedule(day: "day 3",
                             nameExercise: "Meditation",
                             title: "HYPER MOTIVATION",
                             nameAudioFile: "Exawer_monday",
                             duration: "5 min", description: "The meditation session that hypes your motivation as you're facing your task.",
                             text:[""]),
                    Schedule(day: "day 4",
                             nameExercise: "Meditation",
                             title: "SELF-CONFIDENCE BOOST",
                             nameAudioFile: "Exawer_monday",
                             duration: "7 min", description: "As you’re preparing for your task, you’re suffering from low-see esteem or you just want to focus on it. Do this exercise to boost your self-confidence.",text:[""]),
                    Schedule(day: "day 5",
                             nameExercise: "Meditation",
                             title: "SOOTHING MOMENT",
                             nameAudioFile: "Exawer_monday",
                             duration: "7 min", description: "Take a moment to decompress and release your stressful thoughts.",
                             text:[""]),
                    Schedule(day: "day 6",
                             nameExercise: "Breathing",
                             title:"RELAXATION BREATHING" ,
                             nameAudioFile: "Exawer_monday",
                             duration: "7 min", description: "It’s test day. Take some moments to meditate and catch your breath so you’ll be ready, confident and relaxed when you have to perform.",
                             text:[""])
        ]
        
        
        self.paths.append(
            
            PathData(id : 0,subtitle:  NSLocalizedString("Train this power for your exams!", comment: ""), title: "EXAWER", color: "carousel_exawer", description: NSLocalizedString("Are you struggling for your next exam? This is the ideal path for you to stay motivated and focused while taking on your challenge!", comment: ""),
                     week: self.tmp,
                     keywords: ["hurry", "worry", "anxiety", "stress", "exam"]
                ))
        
//        self.tmp.removeAll()
        self.paths.append(
            PathData(id: 1, subtitle: NSLocalizedString("Get ready to become the star of the scene!", comment: ""), title: "RISE AND SHINE", color: "carousel_riseandshine", description:  NSLocalizedString("Are you ready to become the star of your presentation? Get comfortable and follow this quick path to gain confidence and steal the spotlight!", comment: ""),
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
