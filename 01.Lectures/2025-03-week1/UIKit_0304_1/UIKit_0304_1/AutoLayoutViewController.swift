//
//  AutoLayoutViewController.swift
//  UIKit_0304_1
//
//  Created by Uihyun.Lee on 3/4/25.
//


import UIKit

class AutoLayoutViewController: UIViewController {

    let label: UILabel = {
        let label = UILabel()
        label.text = "AutoLayout"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 30,weight:.bold)
        //중요 : Auto Layout 사용을 위한 false
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let redView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //배경색 설정
        view.backgroundColor = .systemYellow
        
        view.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        ])
    }
    
}
