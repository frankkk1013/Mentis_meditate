//
//  MentisMeditateApp.swift
//  MentisMeditate
//
//  Created by Francesco Iaccarino on 11/02/22.
//

import SwiftUI
import AVKit

var MentisPaths: Paths = Paths()
var progress: UseProgress = UseProgress()

@main
struct MentisMeditateApp: App {
    var UIState: UIStateModel = UIStateModel()
    
    
    
    var body: some Scene {
        WindowGroup {
//            ContentView()
            
                Journey()
            
//            Breathing()
        }
    }
}
