//
//  MentisMeditateApp.swift
//  MentisMeditate
//
//  Created by Francesco Iaccarino on 11/02/22.
//

import SwiftUI
import AVKit

var MentisPaths: Paths = Paths()


@main
struct MentisMeditateApp: App {
    var UIState: UIStateModel = UIStateModel()
    @StateObject var progress: UseProgress = UseProgress()
    
    
    
    
    var body: some Scene {
        WindowGroup {
//            ContentView()
            
                Journey(progress: progress)
            
//            Breathing()
        }
    }
}
