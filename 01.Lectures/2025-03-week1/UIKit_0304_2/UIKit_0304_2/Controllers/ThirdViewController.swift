//
//  ThirdViewController.swift
//  UIKit_0304_2
//
//  Created by Uihyun.Lee on 3/4/25.
//

import UIKit

class ThirdViewController: UIViewController {
    var job: String?
    var name: String?

    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Third View Controller"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 30, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        print(name)
        print(job)
        view.backgroundColor = .systemGreen
        // Do any additional setup after loading the view.
        setupLayer()
    }
    func setupLayer() {
        view.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20),
        ])
    }
}
