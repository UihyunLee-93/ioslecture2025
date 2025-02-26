//
//  ViewController.swift
//  UIkit0225_4
//
//  Created by Uihyun.Lee on 2/25/25.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var btnPrev: UIButton!
    @IBOutlet weak var btnNext: UIButton!
    @IBOutlet weak var imgNum: UILabel!
    
    let imgArray = [
        UIImage(named: "1")!,
        UIImage(named: "2")!,
        UIImage(named: "3")!,
        UIImage(named: "4")!,
        UIImage(named: "5")!,
        UIImage(named: "6")!,
    ]
    
    var currentIndex = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateImage()
        // Do any additional setup after loading the view.
    }
    @IBAction func btnPrevImg(_ sender: Any) {
        if currentIndex > 0 {
                    currentIndex -= 1
                    updateImage()
                }
    }
    
    @IBAction func btnNextImg(_ sender: Any) {
        if currentIndex < imgArray.count - 1 {
            currentIndex += 1
            updateImage()
        }
    }
    
    
    func updateImage() {
            imgView.image = imgArray[currentIndex]
        
        imgNum.text = "사진 : \(currentIndex + 1)"

            //이미지를 전환할때 배열index에 따라 버튼 활성 및 비활성
            btnPrev.isEnabled = (currentIndex != 0)
            btnNext.isEnabled = (currentIndex != imgArray.count - 1)
        }
}

