//
//  MentisMeditateApp.swift
//  MentisMeditate
//
//  Created by Francesco Iaccarino on 11/02/22.
//

import SwiftUI
var MentisPaths: Paths = Paths()
@main
struct MentisMeditateApp: App {
    var UIState: UIStateModel = UIStateModel()
    
    var body: some Scene {
        WindowGroup {
//            ContentView()
            NavigationView{
                Journey()
            }
//            Breathing()
        }
    }
}
