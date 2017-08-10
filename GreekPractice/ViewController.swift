//
//  ViewController.swift
//  GreekPractice
//
//  Created by Chaosward on 2017-08-01.
//  Copyright © 2017 Ward&Laos. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var readLabel: UILabel!
    @IBOutlet weak var correctLabel: UILabel!
    @IBOutlet weak var writeField: UITextField!
    @IBOutlet weak var currentCategoryLabel: UILabel!
    
    var langsys = LangSys()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        readLabel.text = langsys.getEnglishWord()
        if let articleType = UserDefaults.standard.object(forKey: "articleType") as? String {
            currentCategoryLabel.text = articleType
        }
        else {
            currentCategoryLabel.text = "DefiniteArticles"
        }
        
    }
    override func viewDidAppear(_ animated: Bool) {
        langsys = LangSys()
        readLabel.text = langsys.getEnglishWord()
        correctLabel.text = ""
        if let articleType = UserDefaults.standard.object(forKey: "articleType") as? String {
            currentCategoryLabel.text = articleType
        }
        else {
            currentCategoryLabel.text = "DefiniteArticles"
        }
    }
    func updateView(){
        if (langsys.checkAnswer(answer: writeField.text!, translateLanguage: "greek")) {
            readLabel.text = langsys.getEnglishWord()
            correctLabel.text = ""
        }
        else{
            correctLabel.text = langsys.getCorrectWord(lang: "greek")
        }
        writeField.text = ""
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        updateView()
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }

}

