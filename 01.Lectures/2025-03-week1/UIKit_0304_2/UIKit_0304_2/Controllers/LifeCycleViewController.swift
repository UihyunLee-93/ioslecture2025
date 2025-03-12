//
//  LifeCycleViewController.swift
//  UIKit_0304_2
//
//  Created by Uihyun.Lee on 3/4/25.
//

import UIKit

class LifeCycleViewController: UIViewController {

    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "LifeCycle"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 30, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Next", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nextButton.addTarget(self, action: #selector(handleNext), for: .touchUpInside)

        view.backgroundColor = .systemGray
        // Do any additional setup after loading the view.
        setupLayer()
    }
    func setupLayer() {
        
        view.addSubview(titleLabel)
        view.addSubview(nextButton)
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20),
            nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nextButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -40),
        ])
    }
    @objc func handleNext() {
        let secondVC = SecondViewController()
        secondVC.userName="이의현"
        secondVC.userJob="iOS Developer"
        navigationController?.pushViewController(secondVC, animated: true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
