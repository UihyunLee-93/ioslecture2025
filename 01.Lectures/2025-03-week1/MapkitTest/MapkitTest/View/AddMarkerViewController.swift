import UIKit
import MapKit
import CoreLocation

protocol AddMarkerDelegate: AnyObject {
    func addMarker(coordinate: CLLocationCoordinate2D, emotion: String, title: String, description: String)
}

class AddMarkerViewController: UIViewController, CLLocationManagerDelegate, UITextFieldDelegate {

    weak var delegate: AddMarkerDelegate?
    private var selectedEmotion = "😊"
    private let emotions = ["😊", "😢", "😡", "🤩", "😐"]
    private var locationManager = CLLocationManager()
    private var currentLocation: CLLocationCoordinate2D?

    private let titleTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "제목 입력"
        textField.borderStyle = .roundedRect
        textField.backgroundColor = UIColor(hex: "#D9B3FF")
        textField.textColor = .black
        textField.font = .systemFont(ofSize: 18)
        return textField
    }()

    private let descriptionTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "설명 입력"
        textField.borderStyle = .roundedRect
        textField.backgroundColor = UIColor(hex: "#D9B3FF")
        textField.textColor = .black
        textField.font = .systemFont(ofSize: 18)
        return textField
    }()

    private let emojiLabel: UILabel = {
        let label = UILabel()
        label.text = "😊"
        label.font = .systemFont(ofSize: 60)
        label.textAlignment = .center
        return label
    }()

    private let emotionSegmentedControl: UISegmentedControl = {
        let segmentedControl = UISegmentedControl(items: ["😊", "😢", "😡", "🤩", "😐"])
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.addTarget(self, action: #selector(emotionChanged(_:)), for: .valueChanged)
        return segmentedControl
    }()

    private let saveButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("저장", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 20)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(hex: "#ff7069")
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(saveMarker), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        overrideUserInterfaceStyle = .dark
        view.backgroundColor = UIColor(hex: "#ff7069")
        title = "마커 추가"

        setupLocationManager()
        setupLayout()

       
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGesture)

        titleTextField.delegate = self
        descriptionTextField.delegate = self
    }

    private func setupLayout() {
        let stackView = UIStackView(arrangedSubviews: [emojiLabel, emotionSegmentedControl, titleTextField, descriptionTextField, saveButton])
        stackView.axis = .vertical
        stackView.spacing = 15
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(stackView)

        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            titleTextField.widthAnchor.constraint(equalTo: stackView.widthAnchor),
            descriptionTextField.widthAnchor.constraint(equalTo: stackView.widthAnchor),
            saveButton.widthAnchor.constraint(equalTo: stackView.widthAnchor)
        ])
    }

    private func setupLocationManager() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            currentLocation = location.coordinate
        }
    }

    @objc private func emotionChanged(_ sender: UISegmentedControl) {
        selectedEmotion = emotions[sender.selectedSegmentIndex]
        emojiLabel.text = selectedEmotion
    }
    @objc private func saveMarker() {
        guard let coordinate = currentLocation else {
            print("위치 정보 없음!")
            return
        }

        let title = titleTextField.text ?? "제목 없음"
        let description = descriptionTextField.text ?? "설명 없음"

      
        view.endEditing(true)

        delegate?.addMarker(coordinate: coordinate, emotion: selectedEmotion, title: title, description: description)
        dismiss(animated: true)
    }

 
    @objc private func dismissKeyboard() {
        view.endEditing(true)
    }


    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
