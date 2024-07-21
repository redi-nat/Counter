//
//  ViewController.swift
//  Counter
//
//  Created by Natasha on 17/07/2024.
//

import UIKit
// я делала пометки для себя, чтобы не запутаться, надеюсь они не будут мешать
class ViewController: UIViewController {
    
    @IBOutlet weak var history: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        history.text = "История изменений:"
        history.isEditable = false
        // сделала поле нередактируемым для пользователя
    }

    var newAction = ""
    var oldText = ""
    var combinedText = ""
    //функия редактирования истории изменений
    func editText(){
        // создаю переменную со временем и датой
        let date = DateFormatter()
        func createDate(){
            date.locale = Locale(identifier: "ru_RU")
            date.dateStyle = .short
            date.timeStyle = .medium
        }
        createDate()
        let actualDate = date.string(from: Date())
        
        oldText = history.text
        combinedText = "\(oldText)\n\(actualDate) \(newAction)"
        history.text = combinedText
    }

    
    @IBOutlet weak var result: UILabel!
    var resultNew: Int = 0
    // функции для каждой кнопки
    @IBOutlet weak var renew: UIButton!
    @IBAction func renewButton(_ sender: Any) {
        resultNew = 0
        result.text = "\(resultNew)" //меняем счет
        newAction = "значение сброшено"
        editText() // отображаем в истории
    }
    
    @IBOutlet weak var plus: UIButton!
    @IBAction func plusButton(_ sender: Any) {
        resultNew += 1
        result.text = "\(resultNew)"
        newAction = "значение изменено на +1"
        editText()
    }
    
    @IBOutlet weak var minus: UIButton!
    @IBAction func minusButton(_ sender: Any) {
        if resultNew >= 1{
        resultNew -= 1
        result.text = "\(resultNew)"
        newAction = "значение изменено на -1"
        editText()
    }else{
        resultNew = 0
        result.text = "\(resultNew)"
        newAction = "попытка уменьшить значение счётчика ниже 0"
        editText()
    }
    }
}
