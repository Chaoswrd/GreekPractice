//
//  SpinController.swift
//  GreekPractice
//
//  Created by Chaosward on 2017-08-09.
//  Copyright © 2017 Ward&Laos. All rights reserved.
//

import UIKit

class SpinController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate{
    @IBOutlet weak var spinner: UIPickerView!
    @IBOutlet weak var currentArticleLabel: UILabel!
    
    var pickerDataSource = ["DefiniteArticles", "IndefiniteArticles", "PresentFirstDeclensionVerb", "PresentMediopassiveFirstDeclensionVerb", "PresentSecondDeclensionVerbFirst", "PresentSecondDeclensionVerbSecond"]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        if let articleType = UserDefaults.standard.object(forKey: "articleType") {
            currentArticleLabel.text = articleType as? String
        }
        else {
            currentArticleLabel.text = "DefiniteArticles"
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerDataSource.count;
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerDataSource[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        // use the row to get the selected row from the picker view
        // using the row extract the value from your datasource (array[row])
        UserDefaults.standard.setValue(pickerDataSource[row], forKey: "articleType")
        currentArticleLabel.text = pickerDataSource[row]
    }

}
