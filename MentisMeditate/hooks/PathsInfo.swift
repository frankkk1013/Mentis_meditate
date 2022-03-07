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
                             title: "5 SENSES DRILL ", nameAudioFile: "Exawer_monday",
                             duration: "7 min",
                             description: "You're preparing for the exam, and YOUR nerves are running high. This morning meditation exercise using the five senses is a great way to keep your emotions under control. ",
                            text: ["When you’re feeling an overwhelming emotion, it can completely capture you",
                                   " And when you notice you’re feeling overwhelmed, (11 sec) this exercise allows you to bring yourself to the here and now.",
                                   " So leave the eyes open"     "and notice five things you can see around you. When you see them,"," you can name them out loud or silently in your head. ","Take some time to visualize each of them.",
                                    "Then, notice four thing you can feel","the texture of your clothing, the smooth surface of the table you’re resting your hands on."," Name them out loud or silently in your head and rest your attention with each sensation for a few deep breaths."
                                   "Now, name three things you can hear. It can be anything you hear in the background - the birds chirping, some people chatting outside.",
                                   "Then, note two things you can smell. If you can’t seem to smell two things, try to bring attention to scents you usually filter out, even the unpleasant ones.",
                                  " Finally, name one thing you can taste. It can be the leftover taste of a meal, your toothpaste or take a sip of a drink to focus on a taste."
]
                            
                            
                            
                            
                            ),
                    Schedule(day: "day 2",
                             nameExercise: "Meditation",
                             title : "ENHANCED FOCUS", nameAudioFile: "Exawer_monday",
                             duration: "7 min", description: "Meditation can help you sharpen your concentration even if you’re feeling under pressure. Start this exercise to increase your focus as you’re approaching your tasks of the day."
                            text: "listen to this session in a safe area where you can sit or lay down"
                             "" Let go any sense of rushing or busyness. (17) You can attend all your duties in just few minutes
                             (23) Be kind to yourself (27) and gift these few minutes just for you
                             (34) Get ready to increase the power of focalization (38) and improve your energy
                             (44) Soften all your muscles (47) and release all your tension throughout your entire body
                             (58) Take a big inhale
                             (1.05 min) Exhale
                             (1.13) Notice the area where your body is comfortable. (1.19) The more you feel these sensations,  (1.23) the more you allow your body (1.25) to spread this throughout your entire body and your unconscious
                             (1.36) Take 3 big breaths [fine 3 min]
                             (1.54) The more your body widens, (1.57) the more you allow your unconscious (2) to have energy and motivate you to be successful
                             (2.12) Do you remember or imagine (2.15) how feeling energetic and motivated is like?
                             (2.22) Your unconscious knows the difference (2.25) between being focused and hyper aware (2.30) which means you can focus on anything you like ((2.34) yourself, study, work, fun) (2.40) or anything in your environment.
                             (2.46) Go with the flow
                             (2.54) Remember when you were young, (2.59) you were full of enthusiasm for life and wonder, (3.03) when most of the activities where fun (3.09) and there is still more for you to look forward to.
                             (3.22) Remind yourself what it’s like being at the surge of energy moving through your body. (3.33) You may feel more alive inside already
                             (3.44) Take a moment to notice any changes
                             (3.57) Imagine all the ways you can improve your life (4.01) by having more time and more energy (4.05) to do the things that you want to do now
                             (4.23) As you continue to focus (4.26) and you become more alert and aware, (4.31) notice how you feel as your mind now knows and amplifies (4.38) the more focused energetic and pleasurable feelings
"
                            
                            
                            
                            
                            ),
                    Schedule(day: "day 3",
                             nameExercise: "Meditation",
                             title: "HYPER MOTIVATION",
                             nameAudioFile: "Exawer_monday",
                             duration: "7 min", description: "The meditation session that hypes your motivation as you're facing your task."),
                    Schedule(day: "day 4",
                             nameExercise: "Meditation",
                             title: "SELF-CONFIDENCE BOOST",
                             nameAudioFile: "Exawer_monday",
                             duration: "7 min", description: "As you’re preparing for your task, you’re suffering from low-see esteem or you just want to focus on it. Do this exercise to boost your self-confidence."),
                    Schedule(day: "day 5",
                             nameExercise: "Meditation",
                             title: "SOOTHING MOMENT",
                             nameAudioFile: "Exawer_monday",
                             duration: "7 min", description: "Take a moment to decompress and release your stressful thoughts."),
                    Schedule(day: "day 6",
                             nameExercise: "Breathing",
                             title:"RELAXATION BREATHING" ,
                             nameAudioFile: "Exawer_monday",
                             duration: "7 min", description: "It’s test day. Take some moments to meditate and catch your breath so you’ll be ready, confident and relaxed when you have to perform.")
        ]
        
        
        self.paths.append(
            
            PathData(id : 0,subtitle: "Train this power for your exams!", title: "EXAWER", color: "carousel_exawer", description: "You're preparing for the exam, and your nerves are running high. These exercises using the five senses is a great way to keep your emotions under control.",
                     week: self.tmp,
                     keywords: ["hurry", "worry", "anxiety", "stress", "exam"]
                ))
        
//        self.tmp.removeAll()
        self.paths.append(
            PathData(id: 1, subtitle: "Get ready to become the star of the scene!", title: "RISE AND SHINE", color: "carousel_riseandshine", description: "You're preparing for the exam, and our nerves are running high. This morning meditation exercise using the five senses is a great way to keep your emotions under control.",
                     week: self.tmp,
                     keywords: ["hurry", "worry", "anxiety", "stress", "exam"]
                )
        
        )
        //            Card_Carousel(id: 2, name: "INNER PARTY", cardColor: "carousel_innerparty", motto: "Train this power for to sit back and relax!"),
        self.paths.append(
            PathData(id: 2, subtitle: "Have a relaxing party with your inner self!", title: "INNER PARTY", color: "carousel_innerparty", description: "You're preparing for the exam, and our nerves are running high. This morning meditation exercise using the five senses is a great way to keep your emotions under control.",
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
