//
//  FileImporter.swift
//  LanguageAppTemplate
//
//  Created by Chaosward on 2017-07-12.
//  Copyright © 2017 Ward&Laos. All rights reserved.
//

import Foundation

class FileImporter {
    var lang:String = ""
    
    init(lang:String) {
        self.lang = lang.lowercased()
    }
    
    func setCategory(category:String) -> [[String:String]]{
        //Get the words in the txt file
        do{
            let path = Bundle.main.path(forResource: category, ofType: "txt") //Path to the file
            let text = try String(contentsOfFile: path!) //Gets complete contents
            let textComponents = text.components(separatedBy: .newlines).dropLast() //Breaks the file into lines
            var langImport:[[String:String]] = []
            
            // prints the content of data.txt
            for arr in textComponents{
                var row = arr.components(separatedBy: ", ") //Separates the line
                langImport.append(["english":"\(row[0])", lang:"\(row[1])"]) //Appends words to global "file array"
            }
            return langImport
        } //Catches the contentsOfFile error
        catch{
            print(error)
            return []
        }
    }
}
