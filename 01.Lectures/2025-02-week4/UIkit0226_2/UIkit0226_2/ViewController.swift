//
//  ViewController.swift
//  UIkit0226_2
//
//  Created by Uihyun.Lee on 2/26/25.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn3: UIButton!
    @IBOutlet weak var btn4: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func showModal(_ sender: UIButton) {
        if sender == btn1 {
            showFullScreenModal()
        } else if sender == btn2 {
            showPageSheetModal()
        } else if sender == btn3 {
            showFormSheetModal()
        }else if sender == btn4 {
            showPopoverModal()
        }
    }
    // 1. 전체화면 모달 (로그인, 온보딩)
    // 1. 전체화면 모달 (로그인, 온보딩)
       func showFullScreenModal() {
           let storyboard = UIStoryboard(name: "Main", bundle: nil)
           if let loginVC = storyboard.instantiateViewController(withIdentifier: "ModalViewController") as? ModalViewController {
               loginVC.modalPresentationStyle = .fullScreen
               loginVC.modalTransitionStyle = .crossDissolve
               present(loginVC, animated: true)
           }
       }
       
       // 2. 카드형 시트 (상세 정보)
       func showPageSheetModal() {
           let storyboard = UIStoryboard(name: "Main", bundle: nil)
           if let detailVC = storyboard.instantiateViewController(withIdentifier: "ModalViewController") as? ModalViewController {
               detailVC.modalPresentationStyle = .pageSheet
               present(detailVC, animated: true)
           }
        }
       
       // 3. 폼 시트 (설정, 입력 폼)
       func showFormSheetModal() {
           let storyboard = UIStoryboard(name: "Main", bundle: nil)
           if let settingsVC = storyboard.instantiateViewController(withIdentifier: "ModalViewController") as? ModalViewController {
               settingsVC.modalPresentationStyle = .formSheet
               present(settingsVC, animated: true)
           }
       }
       
        func showPopoverModal() {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            if let popoverVC = storyboard.instantiateViewController(withIdentifier: "ModalViewController") as? ModalViewController {
                popoverVC.modalPresentationStyle = .popover
                if let popoverController = popoverVC.popoverPresentationController {
                    popoverController.sourceView = btn4  // 팝오버가 표시될 기준 버튼
                    popoverController.sourceRect = btn4.bounds
                }
                present(popoverVC, animated: true)
            }
        }
}

