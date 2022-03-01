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
    Category(image:  "city", details: NSLocalizedString("City", comment: "")),
Category(image: "foresta", details: NSLocalizedString("Forest", comment: "")),
Category(image: "sunset", details: NSLocalizedString("Sunset", comment: "")),
Category(image:  "pioggia", details: NSLocalizedString("Rainy Day", comment: "")),
Category(image:  "libreria", details: NSLocalizedString("Library", comment: "")),
Category(image: "mare", details: NSLocalizedString("Sea", comment: ""))
//Category(image:  "city", details: "City"),
//Category(image:  "city", details: "City"),
//Category(image: "foresta", details: "Forest"),
//Category(image:  "city", details: "City")

]
