//
//  ViewController.swift
//  MyCalculator
//
//  Created by Gilang Ramadhan on 15/01/20.
//  Copyright © 2020 Dicoding Indonesia. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var result: UILabel!
    
    var numberOnScreen = 0.0
    var previousNumber = 0.0
    var operation = 0
    var performingMath = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func numbers(_ sender: UIButton) {
        if performingMath == true {
            result.text = String(sender.tag)
            numberOnScreen = Double(result.text!)!
            performingMath = false
        } else {
            result.text! = result.text! + String(sender.tag)
            numberOnScreen = Double(result.text!)!
        }
    }
    
    @IBAction func action(_ sender: UIButton) {
        if result.text != "" && sender.tag != 15 && sender.tag != 16 {
            previousNumber = Double(result.text!)!
            if sender.tag == 11 {
                result.text = "/"
            } else if sender.tag == 12 {
                result.text = "X"
            } else if sender.tag == 13 {
                result.text = "-"
            } else if sender.tag == 14 {
                result.text = "+"
            }
            operation = sender.tag
            performingMath = true
        } else if sender.tag == 15{
            if operation == 11 {
                result.text = String(previousNumber / numberOnScreen)
            } else if operation == 12 {
                result.text = String(previousNumber * numberOnScreen)
            } else if operation == 13 {
                result.text = String(previousNumber - numberOnScreen)
            } else if operation == 14 {
                result.text = String(previousNumber + numberOnScreen)
            }
        } else if sender.tag == 16 {
            result.text = ""
            numberOnScreen = 0
            previousNumber = 0
            operation = 0
            performingMath = false
        }
    }
    
}

