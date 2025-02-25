//
//  ViewController.swift
//  UIkit0225_2
//
//  Created by Uihyun.Lee on 2/25/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtNum1: UITextField!
    @IBOutlet weak var txtNum2: UITextField!
    
    @IBOutlet weak var lblOper: UITextField!
    
    @IBOutlet weak var lblResult: UILabel!
    
    @IBAction func Calc(_ sender: Any) {
        var num1: Int = Int(txtNum1.text!)!
        var num2: Int = Int(txtNum2.text!)!
        var oper: String = lblOper.text!
      
        switch oper {
        case "+":
            lblResult.text = "결과 : \(num1 + num2)"
        case "-":
            lblResult.text = "결과 : \(num1 - num2)"
        case "*":
            lblResult.text = "결과 : \(num1 * num2)"
        case "/":
            lblResult.text = "결과 : \(num1 / num2)"
        default:
            lblResult.text = "결과없음"
            break
        
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

