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
    var songs: String
    @State var data : Data = .init(count: 0)
    @State var title = ""
    @State var player : AVAudioPlayer!
    @State var playing = false
    @State var width : CGFloat = 0
    @State var current = 0
    @State var finish = false
    @State var del = AVdelegate()
    
    func getData(){
        
        
        let asset = AVAsset(url: self.player.url!)
        
        for i in asset.commonMetadata {
            
            if i.commonKey?.rawValue == "artwork" {
                
                let data = i.value as! Data
                self.data = data
            }
            
            if i.commonKey?.rawValue == "title" {
                
                let title = i.value as! String
                self.title = title
            }
        }
    }
    
    func ChangeSongs(){
        
        let url = Bundle.main.path(forResource: self.songs, ofType: "mp3")
        self.player = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: url!))
        self.player.delegate = self.del
        self.data = .init(count: 0)
        self.title = ""
        self.player.prepareToPlay()
        self.getData()
        self.playing = true
        self.finish = false
        self.width = 0
        self.player.play()
    }
}

var categories : [Category] = [
Category(image:  "Londra", details: "City", songs: "Suono campane di Chiesa"),
//Category(image: "foresta", details: "Forest"),
Category(image: "Sunset", details: "Sunset", songs: "Verso del cane"),
Category(image:  "pioggia", details: "Rainy Day", songs: "Completamente"),
//Category(image:  "libreria", details: "Library"),
Category(image: "mare", details: "Sea", songs: "Emotional Music")
//Category(image:  "city", details: "City"),
//Category(image:  "city", details: "City"),
//Category(image: "foresta", details: "Forest"),
//Category(image:  "city", details: "City")

]


