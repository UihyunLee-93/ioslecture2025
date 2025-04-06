//
//  MarkerDetailViewController.swift
//  MapkitTest
//
//  Created by Uihyun.Lee on 3/13/25.
//


import UIKit
import MapKit

class MarkerDetailViewController: UIViewController {
    
    private let emotionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 40)
        label.textAlignment = .center
        return label
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 20)
        label.textAlignment = .center
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16)
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private let closeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("닫기", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 18)
        button.addTarget(self, action: #selector(closeModal), for: .touchUpInside)
        return button
    }()
    
    private let emotionAnnotation: EmotionAnnotation

    init(emotionAnnotation: EmotionAnnotation) {
        self.emotionAnnotation = emotionAnnotation
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupLayout()
        
        emotionLabel.text = emotionAnnotation.emotion
        titleLabel.text = emotionAnnotation.title ?? "제목 없음"
        descriptionLabel.text = emotionAnnotation.descriptionText
    }

    private func setupLayout() {
        let stackView = UIStackView(arrangedSubviews: [emotionLabel, titleLabel, descriptionLabel, closeButton])
        stackView.axis = .vertical
        stackView.spacing = 15
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }

    @objc private func closeModal() {
        dismiss(animated: true, completion: nil)
    }
}
