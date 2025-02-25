//
//  ViewController.swift
//  UIkit0225_3
//
//  Created by Uihyun.Lee on 2/25/25.
//

import UIKit

class ViewController: UIViewController {
    var isZoom = false
    var imageOn: UIImage?
    var imageOff: UIImage?
    
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var btnZoom: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        imageOn = #imageLiteral(resourceName: "lamp_on")
        imageOff = #imageLiteral(resourceName: "lamp_off")
        
        imgView.image = imageOff
    }

    @IBAction func btnResizeImage(_ sender: UIButton) {
        var w: CGFloat = 0
        var h: CGFloat = 0
        var scale: CGFloat = 1.6
        if isZoom {
            btnZoom.setTitle("확대", for: .normal)
            w = imgView.frame.size.width / scale
            h = imgView.frame.size.height / scale
            
            
           
        } else {
            btnZoom.setTitle("축소", for: .normal)
            
            w = imgView.frame.size.width * scale
            h = imgView.frame.size.height * scale
            
        }
        imgView.frame.size = CGSize(width: w, height: h)
        isZoom = !isZoom
        
    }
    @IBAction func switchImageOnOff(_ sender: UISwitch) {
        if sender.isOn {
            imgView.image = imageOn ?? imageOff
            
        }
        else {
            imgView.image = imageOff ?? imageOn
        }
        
    }
    
}

