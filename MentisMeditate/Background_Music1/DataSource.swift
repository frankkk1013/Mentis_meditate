//
//  Datasource.swift
//  DogFit XCODE APP
//
//  Created by Emanuel Di Nardo on 03/04/2020.
//  Copyright © 2020 Gianluca Pianese. All rights reserved.
//

import Foundation
import SwiftUI
import AVKit

struct Category: Identifiable {
    var id = UUID()
    var image: String
    var details: String
    
}

var categories : [Category] = [
Category(image:  "Londra", details: "City"),
Category(image: "Sunset", details: "Sunset"),
Category(image:  "pioggia", details: "Rainy Day"),
Category(image: "mare", details: "Sea")

]
