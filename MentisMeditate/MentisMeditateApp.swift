//
//  MentisMeditateApp.swift
//  MentisMeditate
//
//  Created by Francesco Iaccarino on 11/02/22.
//

import SwiftUI

@main
struct MentisMeditateApp: App {
    var UIState: UIStateModel = UIStateModel()
    var body: some Scene {
        WindowGroup {
//            ContentView()
//            SnapCarousel(UIState: UIState)
            Breathing()
        }
    }
}
