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

class UseProgress{
    var progress: [ProgressData] = [ProgressData]()
    init(){
        progress.append(ProgressData(pathName: "dasa", progresspercent: "sa"))
        
       let file = self.readLocalFile(forName: "progress")

        parse(jsonData: file!)
    }
    
    
     func readLocalFile(forName name: String) -> Data? {
        do {
            if let bundlePath = Bundle.main.path(forResource: "progress",
                                                 ofType: "json"),
                let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
                
                return jsonData
            }
        } catch {
            print(error)
        }
        
        return nil
    }

    func parse(jsonData: Data) {
        do {
            self.progress = try JSONDecoder().decode([ProgressData].self,
                                                       from: jsonData)
            print(self.progress)
            
            
            print("===================================")
        } catch {
            print(error)
        }
    }
    
    func EncodeSave() {
        do {
            let jsonData = try JSONEncoder().encode(progress)
            let jsonString = String(data: jsonData, encoding: .utf8)!
           try jsonData.write(to: Bundle.main.url(forResource: "progress",
                                                  withExtension: "json")!)
            
            
            print("===================================")
        } catch {
            print("encode error")
        }
    }

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

