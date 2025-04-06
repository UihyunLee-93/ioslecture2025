import UIKit

class EmotionMapViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        let titleLabel = UILabel()
        titleLabel.text = "감정지도 화면"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 22)
        titleLabel.textAlignment = .center

        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleLabel)

        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 40)
        ])
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("감정지도 화면이 나타남")
    }

    @objc func openModal() {
        let modalVC = EmotionInputViewController() // 모달로 표시할 화면
        modalVC.modalPresentationStyle = .pageSheet // 모달 스타일 설정
        modalVC.isModalInPresentation = false // 스와이프 다운 가능하도록 설정

        if let sheet = modalVC.sheetPresentationController {
            sheet.detents = [.medium(), .large()] // 중간 및 전체 크기 지정
            sheet.prefersGrabberVisible = true // 손잡이 표시
        }
        present(modalVC, animated: true)
    }
}
