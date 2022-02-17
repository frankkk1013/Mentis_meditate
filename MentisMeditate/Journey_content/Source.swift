//
//  Source.swift
//  CardView-SwiftUI


import Foundation
import SwiftUI

struct Card : Identifiable {
    var id = UUID()
    
    var subtitle = "MEET THE DEVELOPER"
    var title = "Insider VSCO's Imaging Lab"
    var backgroundImage =  "bg1"
    var briefSummary = "How VSCO brings analog authenticity to your digital shots"
    var description = desPlaceholer
}

let desPlaceholer = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Enim eu turpis egestas pretium aenean pharetra magna ac. Quis enim lobortis scelerisque fermentum. Phasellus faucibus scelerisque eleifend donec pretium. "

let cardData: [Card] = [
    .init(),
    .init(),
    .init(),
    .init()
]
