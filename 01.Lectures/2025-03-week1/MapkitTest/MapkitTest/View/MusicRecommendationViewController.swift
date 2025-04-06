import UIKit

class MusicRecommendationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(hex: "#6A0DAD")?.withAlphaComponent(0.95) 
        setupLayout()
    }

    private func setupLayout() {
        let label = UILabel()
        label.text = "음악 추천 화면"
        label.textColor = UIColor.white
        label.font = .boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(label)

        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}
