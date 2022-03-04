//
//  UseProgress.swift
//  MentisMeditate
//
//  Created by Francesco Iaccarino on 23/02/22.
//

import Foundation
import SwiftUI

struct ProgressData: Codable{
    var pathName: String
    var progresspercent: String
    var exerciseDone : [String] = ["false", "false", "false", "false", "false", "false"]
}

public struct DbConfig: Codable {
    var progress: [String]
}
class UseProgress: ObservableObject{
    var progress: [ProgressData] = [ProgressData]()
    @Published var db = DbConfig(progress: [])    // Object of our db
    @Published var dbLocation: URL? = nil           // Our url to db json file
    @Published var progressFolderUrl: URL? = nil
    
    
    
    
    init(){
//        progress.append(ProgressData(pathName: "dasa", progresspercent: "sa"))
//
//       let file = self.readLocalFile(forName: "progress")
//
//        parse(jsonData: file!)
        loadDecks()
    }
    
    
    func loadDecks(){
        // if let -> used to check if the let exists so you can run the code inside the braces {}
        do {
            // check db file
            let dbInitLocation = try FileManager().url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            let dbURL = dbInitLocation.appendingPathComponent("progress.json")
            let dbExists = FileManager().fileExists(atPath: dbURL.path)
            
            if dbExists {
                // do catch -> check if something goes wrong to handle errors
                // Init our flashdecks and cards folder url
                progressFolderUrl = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
                // we use do catch because Data() can return an error and we need to handle it
                // Data() is used to read an URL location (our db file in that case)
                let data = try Data(contentsOf: dbURL)
                // we need a decoder to decode our json file (we use .self because we want to decode an array but not create a new one
                let decodedData = try JSONDecoder().decode([ProgressData].self, from: data)
                
                // after we load our data we set our flashdecks var to them
                progress = decodedData
                dbLocation.self = dbURL
//                progress.append(decodedFlashdeck)
                print("hello")
                print(progress)
                
                // Adding each flashdeck to our deckList object
//                for deckId in db.progress {
////                    let flashDeckObject = try String(contentsOfFile: "\(progressFolderUrl!.path)/\(deckId).json").data(using: .utf8)
////                    let decodedFlashdeck = try JSONDecoder().decode([ProgressData].self, from: decodedData)
//
//                    progress.append(decodedFlashdeck)
//                    print(progress)
//
//                }
            } else {
                let dbEncoded = try JSONEncoder().encode(db)
                try dbEncoded.write(to: dbURL)
                
                progressFolderUrl = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
                dbLocation.self = dbURL
                print(progressFolderUrl)
            }
            print(progressFolderUrl)
            
        } catch {
            print(error)
        }
    }
    
    func handleUpd(newDeck: ProgressData) -> Bool {
        do {
            for (index, deck) in progress.enumerated(){
                if(deck.pathName == newDeck.pathName){
                    
                    // Delete action
                    
                        // Update new deck
                        // Assign new deck to deck list object
                        progress[index] = newDeck
                        
                        try FileManager.default.removeItem(at: URL(string: "\(progressFolderUrl!.absoluteString)progress.json")!)
                        
                        // Encoding new deck to json
                        let jsonData = try JSONEncoder().encode(progress)
                        
                        // Creating file path and appending new name
                        
                        try jsonData.write(to: URL(string: "\(progressFolderUrl!.absoluteString)progress.json")!)
                        // Writing the data in folder
//                        try jsonString.write(to: fileURL, atomically: true, encoding: String.Encoding.utf8)
                        
                        return true
                    }
                
            }
            return false
        } catch {
            print(error)
            return false
        }
    }
    
    func handleDel(newDeck: ProgressData) -> Bool {
        do {
            for (index, deck) in progress.enumerated(){
                if(deck.pathName == newDeck.pathName){
                    
                    // Delete action
                    
                        // Update new deck
                        // Assign new deck to deck list object
                        progress.remove(at: index)
                        
                        try FileManager.default.removeItem(at: URL(string: "\(progressFolderUrl!.absoluteString)progress.json")!)
                        
                        // Encoding new deck to json
                        let jsonData = try JSONEncoder().encode(progress)
                        
                        // Creating file path and appending new name
                        
                        try jsonData.write(to: URL(string: "\(progressFolderUrl!.absoluteString)progress.json")!)
                        // Writing the data in folder
//                        try jsonString.write(to: fileURL, atomically: true, encoding: String.Encoding.utf8)
                        
                        return true
                    }
                
            }
            return false
        } catch {
            print(error)
            return false
        }
    }
    
    func createProgress(pathName: String) -> Bool {
        
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        var flag = false
        let newDeck = ProgressData(pathName: pathName, progresspercent: "0")
        
        do {
            progress.forEach { prog in
                if(prog.pathName == pathName){
                    flag = true
                }
            }
            
            if(flag == false){
                progress.append(newDeck)
                let jsonData = try JSONEncoder().encode(progress)
    //            try FileManager.default.removeItem(at: URL(string: "\(progressFolderUrl!.absoluteString)progress.json")!)
                try jsonData.write(to: URL(string: "\(progressFolderUrl!.absoluteString)progress.json")!)
            }
//            progress.append(newDeck)
            
            
//            if let url = urls.first {
//                var fileURL = url.appendingPathComponent(String(newDeck.pathName))
//                fileURL = fileURL.appendingPathExtension("json")
//                let jsonString = String(data: jsonData, encoding: .utf8)!
//
//                try jsonString.write(to: fileURL, atomically: true, encoding: String.Encoding.utf8)
//
//                progress.append(String(newDeck.pathName))
//
//                let jsonDb = try JSONEncoder().encode(db)
//                try FileManager.default.removeItem(at: URL(string: "\(progressFolderUrl!.absoluteString)progress.json")!)
//                try jsonDb.write(to: dbLocation!)
//
//                progress.append(newDeck)
//
//                return true
//            }
            return false
            
        } catch {
            print("Error createDeck: \(error)")
            return false
        }
    }

    
//
//     func readLocalFile(forName name: String) -> Data? {
//        do {
//            if let bundlePath = Bundle.main.path(forResource: "progress",
//                                                 ofType: "json"),
//                let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
//
//                return jsonData
//            }
//        } catch {
//            print(error)
//        }
//
//        return nil
//    }
//
//    func parse(jsonData: Data) {
//        do {
//            self.progress = try JSONDecoder().decode([ProgressData].self,
//                                                       from: jsonData)
//            print(self.progress)
//
//
//            print("===================================")
//        } catch {
//            print(error)
//        }
//    }
//
//    func EncodeSave() {
//        do {
//            let jsonData = try JSONEncoder().encode(progress)
//            let jsonString = String(data: jsonData, encoding: .utf8)!
//           try jsonData.write(to: Bundle.main.url(forResource: "progress",
//                                                  withExtension: "json")!)
//
//
//            print("===================================")
//        } catch {
//            print("encode error")
//        }
//    }

}


extension JSONSerialization {
    
    static func loadJSON(withFilename filename: String) throws -> Any? {
        let fm = FileManager.default
        let urls = fm.urls(for: .documentDirectory, in: .userDomainMask)
        if let url = urls.first {
            var fileURL = url.appendingPathComponent(filename)
            fileURL = fileURL.appendingPathExtension("json")
            let data = try Data(contentsOf: fileURL)
            let jsonObject = try JSONSerialization.jsonObject(with: data, options: [.mutableContainers, .mutableLeaves])
            return jsonObject
        }
        return nil
    }
    
    static func save(jsonObject: Any, toFilename filename: String) throws -> Bool{
        let fm = FileManager.default
        let urls = fm.urls(for: .documentDirectory, in: .userDomainMask)
        if let url = urls.first {
            var fileURL = url.appendingPathComponent(filename)
            fileURL = fileURL.appendingPathExtension("json")
            let data = try JSONSerialization.data(withJSONObject: jsonObject, options: [.prettyPrinted])
            try data.write(to: fileURL, options: [.atomicWrite])
            return true
        }
        
        return false
    }
}

