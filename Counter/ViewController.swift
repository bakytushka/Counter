//
//  ViewController.swift
//  Counter
//
//  Created by Bakyt Temishov on 07.11.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var counterHistory: UITextView!
    
    let dateFormatter = DateFormatter()
    var date: String = ""
    var clickCounter: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .medium
        dateFormatter.locale = Locale(identifier: "ru_Ru")
        
    }
    
    @IBAction func countPlus(_ sender: Any) {
        getDate()
        clickCounter += 1
        counterLabel.text = "Значение счётчика: \(clickCounter)"
        counterHistory.text += "\n \(date) значение изменено на +1"
    }
    
    @IBAction func countMinus(_ sender: Any) {
        getDate()
        if clickCounter > 0 {
            clickCounter -= 1
            counterLabel.text = "Значение счётчика: \(clickCounter)"
            counterHistory.text += "\n \(date) значение изменено на -1"
        } else {
                counterHistory.text += "\n \(date) попытка уменьшить значение счётчика ниже 0"
            }
    }
    
    @IBAction func reset(_ sender: Any) {
        getDate()
        clickCounter = 0
        counterLabel.text = "Значение счётчика: \(clickCounter)"
        counterHistory.text += "\n \(date) значение сброшено"
    }
    
    func getDate() {
        let todayDate = Date()
        date = dateFormatter.string(from: todayDate)
    }
    
}

