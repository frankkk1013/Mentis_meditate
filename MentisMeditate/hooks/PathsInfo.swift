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
//    var text: [String]
    var text_eng: [String]
    var text_ita : [String]
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
        self.tmp = [Schedule(day: NSLocalizedString("day 1", comment: ""),
                             nameExercise: "Meditation",
                             title: "5 SENSES DRILL", nameAudioFile: "Exawer_monday",
                             duration: "3 min",
                             description: NSLocalizedString("You're preparing for the exam, and your nerves are running high. This morning meditation exercise using the five senses is a great way to keep your emotions under control. ", comment: ""),
                             text_eng: ["When you’re feeling an overwhelming emotion, it can completely capture you",
                                        "And when you notice you’re feeling overwhelmed,"
                                        , "this exercise allows you to bring yourself to the here and now.",
                                        " So leave the eyes open" ,    "and notice five things you can see around you. When you see them,"," you can name them out loud or silently in your head. ","Take some time to visualize each of them.",
                                        "Then, notice four thing you can feel","the texture of your clothing,"
                                        ,"the smooth surface of the table you’re resting your hands on."," Name them out loud or silently in your head and rest your attention with each sensation for a few deep breaths.",
                                        "Now, name three things you can hear"
                                        ,"It can be anything you hear in the background"
                                        ,"the birds chirping, some people chatting outside",
                                        "Then, note two things you can smell"
                                        ,"If you can’t seem to smell two things, try to bring attention to scents you usually filter out, even the unpleasant ones.",
                                        " Finally, name one thing you can taste"
                                        , "It can be the leftover taste of a meal, your toothpaste or take a sip of a drink to focus on a taste."
                                       ],
                              text_ita: ["Quando ti senti sopraffatto, puoi sentirti scarico"
                                         , "E quando questo capita, questo esercizio ti consente di tornare al qui e ora"
                                         , "Quindi lascia gli occhi aperti"
                                         , "e nota cinque cose che puoi vedere intorno a te"
                                         , "Quando le hai viste, nominale una a una ad alta voce o silenziosamente nella tua testa"
                                         , "Prenditi del tempo per visualizzare ciascuno di questi cinque oggetti"
                                         , "Ora, nota quattro cose che puoi sentire"
                                         , "la trama dei tuoi vestiti"
                                         , "la superficie liscia del tavolo su cui stai appoggiando le mani"
                                         , "Elenca tutto ad alta voce o in silenzio nella tua testa"
                                         , "e riponi la tua attenzione su queste sensazioni per alcuni respiri profondi"
                                         , "Ora, nomina tre cose che puoi ascoltare"
                                         , "Può essere qualsiasi cosa tu senta in sottofondo"
                                         , "il cinguettio degli uccelli",
                                         "alcune persone che chiacchierano fuori"
                                         , "Adesso, nota due cose che puoi annusare"
                                         , "Se non riesci a sentire l'odore di due cose,"
                                         , "cerca di spostare l'attenzione sugli odori che di solito ignori, anche quelli sgradevoli"
                                         , "Infine, nomina una cosa di cui puoi sentire il sapore"
                                         , "Può essere il gusto di qualcosa che hai mangiato da poco,"
                                         , "il tuo dentifricio oppure puoi bere un sorso di un drink per concentrarti su un gusto."
                                        ]
                            
                            
                            
                            
                            ),
                    Schedule(day: NSLocalizedString("day 2", comment: ""),
                             nameExercise: "Meditation",
                             title : "ENHANCED FOCUS", nameAudioFile: "Exawer_monday",
                             duration: "3 min", description: NSLocalizedString("Meditation can help you sharpen your concentration even if you’re feeling under pressure. Start this exercise to increase your focus as you’re approaching your tasks of the day.", comment: ""),
                             text_eng:[ "listen to this session in a safe area where you can sit or lay down"
                                        , " Let go any sense of rushing or busyness." ," You can attend all your duties in just few minutes"
                                        , " Be kind to yourself and gift these few minutes just for you"
                                        , "Get ready to increase the power of focalization and improve your energy"
                                        , "Soften all your muscles and release all your tension throughout your entire body"
                                        , "Take a big inhale"
                                        , "Exhale"
                                        , "Notice the area where your body is comfortable. The more you feel these sensations,"
                                        , "the more you allow your body (1.25) to spread this throughout your entire body and your unconscious"
                                        , "Take 3 big breaths"
                                        , "The more your body widens, the more you allow your unconscious"
                                        , "to have energy and motivate you to be successful"
                                        , "Do you remember or imagine how feeling energetic and motivated is like?"
                                        , "Your unconscious knows the difference between being focused and hyper aware"
                                        , "which means you can focus on anything you like" , "(yourself, study, work, fun) or anything in your environment"
                                        , "Go with the flow"
                                        , "Remember when you were young,"
                                        , "you were full of enthusiasm for life and wonder,"
                                        , "when most of the activities where fun"
                                        , "and there is still more for you to look forward to"
                                        , "Remind yourself what it’s like being at the surge of energy moving through your body"
                                        , "You may feel more alive inside already"
                                        , "Take a moment to notice any changes"
                                        , "Imagine all the ways you can improve your life"
                                        , "by having more time and more energy"
                                        , "to do the things that you want to do now"
                                        , "As you continue to focus"
                                        , "and you become more alert and aware,"
                                        , "notice how you feel as your mind now knows and amplifies"
                                        , "the more focused energetic and pleasurable feelings"
                                      ],
                             text_ita: ["Inizia questa sessione quando sei in un'area sicura dove puoi sederti o sdraiarti"
                                        , "Lascia andare ogni senso di fretta o di frenesia" , "Puoi svolgere tutti i tuoi compiti tra pochi minuti"
                                        , "Ora sii gentile con te stesso"
                                        , "e concediti questi pochi minuti"
                                        , "Preparati ad aumentare il potere di focalizzazione"
                                        , "e migliorare la tua energia"
                                        , "Rilassa i muscoli"
                                        , "e rilascia la tensione su tutto il corpo"
                                        , "Inspira profondamente"
                                        , "Ora espira"
                                        , "Concentrati sull'area in cui il tuo corpo si sente a suo agio"
                                        , "Più senti queste sensazioni,"
                                        , "più permetti al tuo corpo di diffonderle in tutto il tuo corpo e nel tuo inconscio"
                                        , "Ora fai 3 grandi respiri"
                                        , "Più il tuo corpo vaga,"
                                        , "più permetti al tuo inconscio di avere energia"
                                        , "e trovare motivazione per avere successo"
                                        , "Riesci a ricordare o a immaginare com'è sentirsi energici e motivati?"
                                        , "Il tuo inconscio conosce la differenza tra essere concentrato e iperconsapevole,"
                                        , "il che significa che puoi concentrarti su tutto ciò che ti piace"
                                        , "te stesso, il lavoro, lo studio, il divertimento"
                                        ," o qualsiasi cosa nel tuo ambiente"
                                        , "Segui la corrente"
                                        , "Ricorda quando eri piccolo"
                                        , "e pieno di entusiasmo per la vita,"
                                        , "pieno di meraviglia,"
                                        , "quando la maggior parte delle attività ti sembrava divertente"
                                        , "e sentivi ci fosse ancora molto da vendere"
                                        , "Ricorda a te stesso com'è sentire un'onda di energia"
                                        , "che si muove attraverso il tuo corpo"
                                        , "Potresti già sentirti più vivo dentro"
                                        , "Ora prenditi un momento per notare eventuali cambiamenti"
                                        , "Immagina tutti i modi in cui puoi migliorare la tua vita" , "avendo più tempo e più energia"
                                        , "per fare le cose che vuoi fare"
                                        , "Mentre continui a concentrarti"
                                        , "e diventi più vigile e consapevole,"
                                        , "rifletti su come ti senti"
                                        , " mentre la tua mente ora è consapevole"
                                        ," e amplifica questa sensazione piacevole di energia"
                                       ]
                             





                            ),
                    Schedule(day: NSLocalizedString("day 3", comment: ""),
                             nameExercise: "Meditation",
                             title: "HYPER MOTIVATION",
                             nameAudioFile: "Exawer_monday",
                             duration: "5 min", description: NSLocalizedString("The meditation session that hypes your motivation as you're facing your task.", comment: ""),
                             text_eng: ["Take a moment to settle your body into a comfortable position"
                                        ,"Let your shoulders open outwards a little"
                                        , "You may close your eyes or keep them slightly open, maybe looking downward a few feet in front of you"
                                        , "Lift your spine and let your shoulders soften"
                                        , "Now take a big, deep breath in,"
                                        , "then a long, slow breath out"
                                        , "Focus on how your breath moves through your nose,"
                                        , "into your mouth, into your lungs"
                                        ,"and then back out"
                                        ,"Allow the mind to focus on the breath"
                                        , "Now, call to mind something where you might be feeling a lack of motivation"
                                        , "Perhaps it’s the preparation for your next exam"
                                        ," or a presentation or a project you’re working on"
                                        , "As you envision your task,"
                                        , " listen to these questions lightly and see what comes up"
                                        ," Don’t worry if nothing comes to mind"
                                        , "Just continue to focus on your breath and notice what thoughts comes to your mind"
                                        , "What is your aspiration when you think about this task?"
                                        , "Is there any reason why you don’t feel motivated or focused?"
                                        , "Now see yourself approaching this task"
                                        , "Imagine how great it feels to get started"
                                        , "See yourself starting the task,"
                                        ," feeling proud of yourself for taking that step"
                                        , "Envision yourself completing projects bit by bit"
                                        ,"working away until they are finished"
                                        , "Imagine how good you will feel to have started a difficult task"
                                        , "Allow yourself to be filled with feelings of accomplishment and confidence"
                                        , "And if you’re feeling like the task is not enjoyable"
                                        , "imagine how great you’ll feel when the task will be done"
                                        , "Imagine how good and successful you will feel, even if you do not do things perfectly"
                                        , "Let yourself feel good about your future efforts"
                                        , "Now take a big, deep breath in through your nose, out of your mouth"
                                        , "Then just gently open your eyes again."
                                       ],
                             
                             text_ita: ["Prenditi un momento per sistemare il tuo corpo in una posizione comoda"
                                        , "Lascia che le tue spalle si aprano leggermente verso l'esterno"
                                        , "Puoi chiudere gli occhi o tenerli leggermente aperti,"
                                        , "magari guardando in basso, in un punto a qualche metro di fronte a te"
                                        , "Solleva la colonna vertebrale e lascia che le spalle si rilassino"
                                        , "Ora fai un respiro grande e profondo,"
                                        , " poi un respiro lungo e lento"
                                        , " Concentrati su come il respiro si muove attraverso il naso,"
                                        , "la bocca, i polmoni e poi torna indietro"
                                        , "Consenti alla mente di concentrarsi sul respiro"
                                        , "Ora, ricorda una circostanza in cui potresti sentire una mancanza di motivazione"
                                        , "Forse è la preparazione per il tuo prossimo esame" , "oppure una presentazione o un progetto su cui stai lavorando"
                                        , "Mentre immagini il tuo compito,"
                                        , "ascolta queste domande con serenità e guarda cosa ti viene in mente"
                                        , "Non preoccuparti se non ti viene in mente nulla"
                                        , "Continua a concentrarti sul respiro e nota quali pensieri ti vengono in mente"
                                        , "Qual è la tua aspirazione quando pensi a questo compito?"
                                        , "C’è qualche motivo per cui non ti senti motivato o concentrato?"
                                        , "Ora guardati mentre ti avvicini a questa scadenza"
                                        , "Immagina quanto è bello iniziare a lavorarci"
                                        , "Guarda te stesso iniziare quest'attività,"
                                        , "sentiti orgoglioso di te stesso per aver fatto quel passo"
                                        , "Immagina di completare i progetti a poco a poco"
                                        , "lavorando fino al termine"
                                        , "Immagina quanto ti sentirai bene ad aver iniziato un compito difficile"
                                        , "Consenti a te stesso di essere riempito con sentimenti di realizzazione e fiducia"
                                        , "E se ritieni che il compito non sia piacevole,"
                                        , "immagina quanto ti sentirai bene quando il compito sarà terminato"
                                        , "Immagina quanto ti sentirai bravo e di successo,"
                                        , "anche se non farai le cose perfettamente"
                                        , "Permetti a te stesso di essere positivo riguardo ai tuoi sforzi futuri"
                                        , "Ora fai un respiro grande e profondo attraverso il naso,"
                                        , "poi espira dalla bocca"
                                        , "Quindi apri di nuovo delicatamente gli occhi."
                                       ]),
                    
                    Schedule(day: NSLocalizedString("day 4", comment: ""),
                             nameExercise: "Meditation",
                             title: "SELF-CONFIDENCE BOOST",
                             nameAudioFile: "Exawer_monday",
                             duration: "7 min", description: NSLocalizedString("As you’re preparing for your task, you’re suffering from low-see esteem or you just want to focus on it. Do this exercise to boost your self-confidence.", comment: ""),
                             text_eng:["Take a moment to settle your body into a comfortable position"
                                            ," Take a big, deep breath it, then a long, slow breath out"
                                            , "Focus on your breath"
                                            , "As you breath in, feel the lungs expanding"
                                            , "and as you breath out,"
                                            ," feel the muscles soften"
                                            , "Now gently close your eyes or just maintain a soft focus,"
                                            , "as your eyes are open but not looking at anything particular right now"
                                            , "Focus on the feeling of contact between your body and the seat below you"
                                            , " Just notice the weight coming off your body,"
                                            , "notice how your feet feel on the floor"
                                            , "Just take a moment to settle into the space around you"
                                            , "Focus on the feeling of ease of your body"
                                            , "Focus on how your body feels as you breath in and breath out"
                                            , "Now start breathing in for a count of four,"
                                            , "holding for four, breathing out for four,"
                                            , "hold for four"
                                            , "Then repeat this breathing scheme for 1 minute"
                                            , "Now continue to breathe with your eyes closed and focus on your mind"
                                            , "trying to imagine a place where you feel completely at ease"
                                            , "It may be a favorite place you have been"
                                            , "or somewhere you have seen"
                                            , "or it might be completely imaginary"
                                            , "Picture this place where you feel happy and calm"
                                            , "Create the details about this place in your mind"
                                            , "Visualize the sights, the sounds, the smells of your place"
                                            , "Imagine how you feel physically"
                                            , "You are comfortable, enjoying being still and relaxing..."
                                            , "Enjoy the way you feel in this safe place"
                                            , "You feel calm and safe here. At peace with yourself"
                                            , "Now, pick one thing that you could only do if you were feeling highly confident"
                                            ,"For example, imagine yourself succeed in your exam"
                                            , "While you’re visualizing yourself in this scenario,"
                                            , "imagine a feeling of extreme confidence"
                                            , "Try to feel the energy you have in this scenario"
                                            ," And now ask yourself these questions:"
                                            
                                            , "How would I be standing?"
                                            , "What would my posture be?"
                                            , "How would I be acting?"
                                            , "What I would be saying?"
                                            , "What I would be feeling?"
                                            
                                            , "If your mind is producing some negative thoughts while you’re answering to those questions,"
                                            ,"don’t worry"
                                            , "It happens because your mind is unconsciously showing you the obstacles of that scenario" , "Let’s try to remove the obstacles your mind is naming"
                                            , "Focus on each negative thought and label it saying “it’s just a thought”."
                                            , "Do this with all the negative thoughts"
                                            , "Now focus on your breath again"
                                            , "As you breath in, feel the lungs expanding"
                                            , "and as you breath out, feel the muscles soften"
                                            , "Then gently open your eyes again."],
                                           text_ita: ["Prenditi un momento per sistemare il tuo corpo in una posizione comoda"
                                                      , "Fai un respiro grande e profondo,"
                                                      , "poi un respiro lungo e lento"
                                                     , "Concentrati sul respiro"
                                                      , "Mentre inspiri, senti i polmoni espandersi"
                                                      , "e mentre espiri, senti i muscoli che si rilassano"
                                                      , "Ora chiudi delicatamente gli occhi o tieni i tuoi occhi aperti"
                                                      , "ma fa che non guardino nulla di particolare in questo momento"
                                                      , "Concentrati sulla sensazione di contatto tra il tuo corpo e il sedile sotto di te"
                                                      , "Nota solo il peso che viene via dal tuo corpo,"
                                                      , "nota come si sentono i tuoi piedi sul pavimento"
                                                      , "Prenditi un momento per stabilirti nello spazio intorno a te"
                                                      , "Concentrati sulla sensazione di benessere del tuo corpo"
                                                      , "Concentrati sulle sensazioni del tuo corpo mentre inspiri ed espiri"
                                                      , "Ora inizia a inspirare contando fino a quattro secondi,"
                                                      , "poi trattieni il respiro per quattro secondi,"
                                                      , "poi espira per per quattro secondi,"
                                                      , "infine trattieni in respiro per quattro secondi"
                                                      , "Quindi ripeti questo schema di respirazione per 1 minuto"
                                                      , "Ora continua a respirare con gli occhi chiusi e concentrati sulla mente,"
                                                      , "cercando di immaginare un luogo in cui ti senti completamente a tuo agio"
                                                      , "Potrebbe essere un posto preferito in cui sei stato,"
                                                      ,"o un posto che hai visto, o potrebbe essere completamente immaginario"
                                                      , "Immagina questo posto dove ti senti felice e calmo"
                                                      , "Pensa ai dettagli di questo posto nella tua mente"
                                                      , "Visualizza i panorami, i suoni, gli odori del tuo posto"
                                                      , "Immagina come ti senti fisicamente"
                                                      , "Sei a tuo agio, ti diverti a stare fermo e a rilassarti..."
                                                      , "Goditi il ​​modo in cui ti senti in questo luogo sicuro"
                                                      , "Ti senti calmo e al sicuro qui. In pace con te stesso"
                                                      , "Ora, scegli una cosa che potresti fare solo se ti sentissi molto sicuro di te"
                                                      , "Ad esempio, immagina di riuscire nell'esame"
                                                      , "Mentre visualizzi te stesso in questo scenario,"
                                                      , "immagina una sensazione di estrema sicurezza" , "Prova a sentire l'energia che hai in questo scenario"
                                                      , "E ora poniti queste domande:"

                                                      , "Come starei in piedi?"
                                                      , "Quale sarebbe la mia postura?"
                                                      , "Come mi comporterei?"
                                                      , "Cosa direi?"
                                                     , "Cosa proverei?"

                                                      , "Se la tua mente sta producendo dei pensieri negativi mentre rispondi a queste domande,"
                                                      , "non preoccuparti"
                                                      , "Succede perché la tua mente ti sta mostrando inconsciamente gli ostacoli di quello scenario"
                                                      , "Proviamo a rimuovere gli ostacoli che la tua mente sta trovando"
                                                     , "Concentrati su ogni pensiero negativo ed etichettalo dicendo 'è solo un pensiero'"
                                                      , "Fallo con tutti i pensieri negativi"
                                                     , "Ora concentrati di nuovo sul respiro"
                                                      , "Mentre inspiri, senti i polmoni espandersi"
                                                      , "e mentre espiri, senti i muscoli che si rilassano"
                                                      , "Quindi apri di nuovo delicatamente gli occhi."
              ]),
                    Schedule(day: NSLocalizedString("day 5", comment: ""),
                             nameExercise: "Meditation",
                             title: "SOOTHING MOMENT",
                             nameAudioFile: "Exawer_monday",
                             duration: "7 min", description: NSLocalizedString("Take a moment to decompress and release your stressful thoughts.", comment: ""),
                             text_eng: ["No matter what’s going on right now,"
                                        , "no matter why your mind is stressed right now"
                                        , "Just take a moment to sit down, get comfortable,"
                                        , "back straight, the eyes open,"
                                        , "stop focus with the eyes and start with big breath"
                                        , "Focus on the space around you without moving your eyes"
                                        , "Take a big, deep breath in through your nose"
                                        , "and out through your mouth"
                                        , "Feel the lungs expanding, and as you breath out"
                                        , "feel a sense of letting go any stress in the body"
                                        , "in the mind"
                                        , "Find your pace"
                                        , "and notice how your body fills with fresh air as you breathe in"
                                        , "and how your muscles soften as you breath out"
                                        , "Breath in, close the eyes,"
                                        , "breath out: just let it go"
                                        , "Let it go whatever is going on in the mind, in the body"
                                        , "Let it go that feeling of stress and tension"
                                        , "Feel the muscles soften"
                                        , "Breath in through your nose and out through your mouth"
                                        , "Take a moment to pause"
                                        , "And then allow the mind to do its own thing"
                                        , "let the thoughts to come and go"
                                        , "And then just gently open your eyes again."
                                       ],
                                      text_ita: ["Non importa cosa stia succedendo in questo momento,"
                                                 , "non importa per quale motivo la tua mente sia stressata in questo momento"
                                                 , "Prenditi un momento per sederti, metterti comodo,"
                                                 , "schiena dritta, gli occhi aperti,"
                                                 , "non concentrarti nel mettere a fuoco con gli occhi e inizia con un respiro profondo"
                                                 , "Concentrati sullo spazio intorno a te senza muovere gli occhi"
                                                 , "Fai un respiro lungo e profondo dal naso ed espira dalla bocca"
                                                 , "Senti i polmoni che si espandono e, mentre espiri,"
                                                 , "senti la sensazione di lasciar andare qualsiasi stress nel corpo,"
                                                 , "nella mente"
                                                 , "Trova il tuo ritmo"
                                                 , "e nota come il tuo corpo si riempie di aria fresca mentre inspiri"
                                                 , "e come i tuoi muscoli si rilassano mentre espiri"
                                                 , "Inspira, chiudi gli occhi, espira"
                                                 , " lascia andare"
                                                 , "Lascia andare qualunque cosa stia succedendo nella mente, nel corpo"
                                                 , "Lascia andare quella sensazione di stress e tensione"
                                                 , "Senti i muscoli rilassarsi"
                                                 , "Inspira dal naso ed espira dalla bocca"
                                                 , "Prenditi un momento per fare una pausa"
                                                 , "E poi permetti alla mente di fare le sue cose,"
                                                 , "lascia che i pensieri vadano e vengano"
                                                 , "Infine apri di nuovo delicatamente gli occhi"
         ]),
                    Schedule(day: NSLocalizedString("day 6", comment: ""),
                             nameExercise: "Breathing",
                             title:"RELAXATION BREATHING" ,
                             nameAudioFile: "Exawer_monday",
                             duration: "7 min", description: NSLocalizedString("It’s test day. Take some moments to meditate and catch your breath so you’ll be ready, confident and relaxed when you have to perform.", comment: ""),
                             text_eng:["Usually, when we’re approaching an exam,"
                                       , "there is a tough feeling of stress, pressure"
                                       , "A lot of this tension comes from identifying with the outcome"
                                       , "We focus too much on the results we want to have,"
                                       , "we feel the need to do well"
                                       , "Instead, we can identify more with the process,"
                                       , "looking at the work we have to do as something we should enjoy,"
                                       , "so we’ll put our best foot forward"
                                       , "But if our mind is too tight and narrow,"
                                       , "then it’s very difficult to think things through in a rational way"
                                       , "So this exercise will help you to relax,"
                                       , "shifting the focus of the breath from our heads, into our bodies"
                                       , "Our breath usually reflects how our mind is feeling,"
                                       , "so if we can learn to slow down the breath, we can reach a deeper balance"
                                       , "With eyes open, start to breath a little bit deeper and slower"
                                       , "breathing in through the nose and out through the mouth" , "Focus on how your body feels while you breathe in and you breathe out"
                                       , "If it helps, you can put your hand on your lap,"
                                       , "so you’ll feel the movement your body does"
                                       , "when you’re breathing and fresh air fills the chest"
                                       , "So as you continue to follow that movement,"
                                       , "think about the rising and falling of your chest,"
                                       , "then start counting your breaths"
                                       , "One for inhale, you feel your chest rising,"
                                       , "two for exhale, your chest is falling"
                                       , "Do it again"
                                       , "One, feel the rising sensation,"
                                       , "two, focus on the falling sensation"
                                       , "And do it again"
                                       , "While you’re breathing in and out,"
                                       , "allow your thoughts to come and go"
                                       , "As you breathe, your mind softens,"
                                       , "following the movement of your chest"
                                       , "Focus on the feeling of completion at the end of each breath,"
                                       , "then repeat the process"
                                       , "Now return the breath back to its natural rhythm,"
                                       , "and take a moment just to scan the body"
                                       , "Starting at the top of the head,"
                                       , "just notice where the body feels a bit tense or tight"
                                       , "and where it feels more relaxed"
                                       , "Continue this scanning process slowly,"
                                       , "seeing if you can let go breath by breath"
                                       , "And repeat this process for all your body,"
                                       , "ending at your feet"
                                       , "Now, just gently bring the focus back to the breath,"
                                       , "feeling your breath as it comes in and goes out"
                                       , "Now gently bring your attention"
                                       , "back to the touch of your body on your seat"
                                       , "and open your eyes."
                                      ],
                                      
                                      text_ita: ["Di solito, quando ci avviciniamo a un esame,"
                                                 , "c'è una forte sensazione di stress, pressione"
                                                     , "Gran parte di questa tensione deriva dall'identificazione con il risultato"
                                                 , "Ci concentriamo troppo sui risultati che vogliamo ottenere,"
                                                 , "sentiamo il bisogno di fare bene"
                                                 , "Invece, possiamo identificarci di più con il processo,"
                                                 , "considerando il lavoro che dobbiamo fare come qualcosa durante il quale dovremmo divertirci,"
                                                 , "quindi faremo del nostro meglio"
                                                 , "Ma se la nostra mente è troppo ristretta e irrigidita"
                                                 , "allora è molto difficile pensare alle cose in modo razionale"
                                                 , "Quindi questo esercizio ti aiuterà a rilassarti"
                                                 , "spostando il focus del respiro dalla nostra testa al nostro corpo"
                                                 , "Il nostro respiro di solito riflette come si sente la nostra mente"
                                                 , "quindi se possiamo imparare a rallentare il respiro"
                                                 , "possiamo raggiungere un equilibrio più profondo"
                                                 , "Con gli occhi aperti,"
                                                 , "inizia a respirare un po' più profondamente e più lentamente,"
                                                 , "inspirando attraverso il naso"
                                                 , "ed espirando attraverso la bocca"
                                                 , "Concentrati su come si sente il tuo corpo mentre inspiri ed espiri"
                                                 , "Se aiuta, puoi mettere la mano in grembo,"
                                                 , "così sentirai il movimento che fa il tuo corpo quando respiri"
                                                 , "e l'aria fresca riempie il petto"
                                                 , "Quindi, mentre continui a seguire quel movimento,"
                                                 , "pensa all'alzarsi e all'abbassarsi del petto o della pancia,"
                                                 , "quindi inizia a contare i respiri"
                                                 , "Uno, inspira, senti il ​​petto sollevarsi,"
                                                 , "due, espira, il petto si abbassa"
                                                 , "Fallo ancora"
                                                 , "Uno, senti la sensazione di aumento,"
                                                 , "due, concentrati sulla sensazione di caduta"
                                                 , "E fallo di nuovo"
                                                 , "Mentre inspiri ed espiri, lascia che i tuoi pensieri vadano e vengano"
                                                 , "Mentre respiri, la tua mente si rilassa, seguendo il movimento del tuo petto"
                                                 , "Concentrati sulla sensazione di completamento alla fine di ogni respiro,"
                                                 , "quindi ripeti il ​​processo"
                                                 , "Ora riporta il respiro al suo ritmo naturale"
                                                 , "e prenditi un momento solo per esaminare il corpo"
                                                 , "Partendo dalla sommità della testa,"
                                                 , "nota dove il corpo si sente un po' teso o irrigidito e dove si sente più rilassato"
                                                 , "Continua lentamente questo processo di scansione,"
                                                 , "verificando se riesci a lasciar andare respiro dopo respiro"
                                                 , "E ripeti questo processo per tutto il tuo corpo, finendo quando arrivi ai tuoi piedi"
                                                 , "Ora, riporta delicatamente la concentrazione sul respiro,"
                                                 , "sentendo il tuo respiro mentre entra ed esce"
                                                 , "Ora riporta delicatamente la tua attenzione al tocco del tuo corpo sulla sedia"
                                                 , "e apri gli occhi."])
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
