//
//  SecondViewController.swift
//  UIKit_0304_2
//
//  Created by Uihyun.Lee on 3/4/25.
//

import UIKit

class SecondViewController: UIViewController {
 
    var userName: String?
    var userJob: String?

    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Second View Controller"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 30, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let thirdButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Third View Controller", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(userName)
        print(userJob)
        view.backgroundColor = .systemOrange
        
        thirdButton.addTarget(self, action: #selector(handleThirdButton), for: .touchUpInside)
        // Do any additional setup after loading the view.
        setupLayer()
    }
    func setupLayer() {
        view.addSubview(titleLabel)
        view.addSubview(thirdButton)
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20),
            thirdButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -40),
            thirdButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    @objc func handleThirdButton() {
        let thirdVC = ThirdViewController()
        thirdVC.name = userName
        thirdVC.job = userJob
        navigationController?.pushViewController(thirdVC, animated: true)
    }

}
