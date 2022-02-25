//
//  Datasource.swift
//  DogFit XCODE APP
//
//  Created by Emanuel Di Nardo on 03/04/2020.
//  Copyright © 2020 Gianluca Pianese. All rights reserved.
//

import Foundation
import SwiftUI


struct Category: Identifiable {
    var id = UUID()
    var image: String
    var details: String
}

var categories : [Category] = [
Category(image:  "city", details: "City"),
Category(image: "foresta", details: "Forest"),
Category(image: "sunset", details: "Sunset"),
Category(image:  "pioggia", details: "Rainy Day"),
Category(image:  "libreria", details: "Library"),
Category(image: "mare", details: "Sea")
//Category(image:  "city", details: "City"),
//Category(image:  "city", details: "City"),
//Category(image: "foresta", details: "Forest"),
//Category(image:  "city", details: "City")

]
