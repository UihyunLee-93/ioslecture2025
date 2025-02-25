//
//  ViewController.swift
//  UIkit0225
//
//  Created by Uihyun.Lee on 2/25/25.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var btnSend: UIButton!
    @IBOutlet weak var txtName: UITextField!
    
    @IBOutlet weak var lblHello: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        lblHello.text = "안녕하세요"
        
        
    }
    
    
    
    
    @IBAction func changeGreeting(_ sender: UIButton) {
        print("button tapped", sender.titleLabel?.text!)
        if btnSend == sender{
            print("버튼이 Send인 경우!")
            // guard let name = txtName.text else { return }
            let name = txtName.text ?? "익명"
            print("텍스트 필드에 입력된 이름은 (name)입니다.")
            lblHello.text = "(name)님 안녕하세요!"
        }else {
            print("is reset")
            lblHello.text = "Hello!"
            txtName.text = ""
            
        }
    }
    


}

