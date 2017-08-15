//
//  LangSys.swift
//  GreekPractice
//
//  Created by Chaosward on 2017-08-01.
//  Copyright © 2017 Ward&Laos. All rights reserved.
//

import Foundation

class LangSys {
    let targetLanguage = "greek"
    
    var langs:[[String:String]] = []
    var count = 0
    
    init() {
        let fl = FileImporter(lang: "greek")
        if let articleType = UserDefaults.standard.object(forKey: "articleType") {
            langs = fl.setCategory(category: "\(articleType as! String)")
        }
        else{
            langs = fl.setCategory(category: "DefiniteArticles")
        }
        //print(langs)
        
        //Singularis nom, acc, gen
        //Masculine, ο, του, το(ν)
        //Feminime, η, της, τη(ν)
        //Neuter, το, του, το
        
        //Pluraris
        //Maskulinum, οι, των, τους
        //Femininum, οι, των, τις
        //Neutrum, τα, των, τα
    }
    
    func checkAnswer(answer:String, translateLanguage: String) -> Bool {
        if(answer.lowercased().trimmingCharacters(in: CharacterSet.whitespaces) == getWord(lang: translateLanguage)){
            nextWord()
            return true
        }
        return false
    }
    
    private func getWord(lang:String) -> String {
        return langs[count][lang]!
    }
    func getForeignWord() -> String {
        return getWord(lang: targetLanguage)
    }
    func getEnglishWord() -> String {
        return getWord(lang: "english")
    }
    func getCorrectWord(lang: String) -> String {
        return getWord(lang: lang)
    }
    
    
    func nextWord() {
        count+=1
        count%=langs.count
    }
}
