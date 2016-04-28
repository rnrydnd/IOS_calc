//
//  ViewController.swift
//  Exam02
//
//  Created by SDS-104 on 2016. 4. 27..
//  Copyright © 2016년 SDS-104. All rights reserved.
//

import UIKit

enum OPER{
    case NONE
    case PLUS
    case MINUS
    case MULTIPLIED
    case DIVIEDED
}

class ViewController: UIViewController {
    
    var lastVal:Double? // 값
    var lastOper:OPER = .NONE // 연산자

    @IBOutlet weak var result: UILabel!
    
    @IBAction func buttonClick(sender: AnyObject) {
        let button = sender as! UIButton
        let inputText = (button.titleLabel?.text)!

        
        switch inputText {
        case "+":
            if result.text?.characters.count > 0 {
            lastVal = Double(result.text!)!
            lastOper = .PLUS
            result.text = ""
            }
        case "-":
            print(result.text)
            lastVal = Double(result.text!)!
            lastOper = .MINUS
            result.text = ""
        case "*":
            lastVal = Double(result.text!)!
            lastOper = .MULTIPLIED
            result.text = ""
        case "/":
            lastVal = Double(result.text!)!
            lastOper = .DIVIEDED
            result.text = ""
        case "C":
            lastVal = nil
            lastOper = .NONE
            result.text = ""
        case "=":
            if lastVal != nil && result.text?.characters.count > 0 {
                result.text = String(calc(lastVal!, oper:lastOper, lastVal: Double(result.text!)!))
            }
        default:
            result.text = result.text! + inputText
        }
    }
    
    func calc(firstVal:Double, oper:OPER, lastVal:Double) -> Double {
        var returnVal = 0.0
        
        switch oper {
        case .PLUS:
            returnVal = firstVal + lastVal
        case .MINUS:
            returnVal = firstVal - lastVal
        case .MULTIPLIED:
            returnVal = firstVal * lastVal
        case .DIVIEDED:
            returnVal = firstVal / lastVal
        default:
            break
        }
        return returnVal
    }
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

