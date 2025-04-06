import UIKit
import FirebaseStorage
import FirebaseFirestore
import FirebaseAuth

class FeedUploadViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    private let textView = UITextView()
    private let imageView = UIImageView()
    private let uploadButton = UIButton(type: .system)
    private let imagePicker = UIImagePickerController()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    private func setupUI() {
        view.backgroundColor = .white
        title = "새 피드 작성"

        textView.layer.borderWidth = 1
        textView.layer.borderColor = UIColor.lightGray.cgColor
        textView.text = "내용 입력..."
        textView.font = UIFont.systemFont(ofSize: 16)

        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.borderWidth = 1
        imageView.layer.borderColor = UIColor.lightGray.cgColor
        imageView.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(selectImage))
        imageView.addGestureRecognizer(tapGesture)

        uploadButton.setTitle("업로드", for: .normal)
        uploadButton.addTarget(self, action: #selector(uploadFeed), for: .touchUpInside)

        // 높이 제약 추가
        textView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 200).isActive = true

        let stackView = UIStackView(arrangedSubviews: [textView, imageView, uploadButton])
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)

        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            stackView.bottomAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ])
    }


    @objc private func selectImage() {
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true)
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        if let selectedImage = info[.originalImage] as? UIImage {
            imageView.image = selectedImage
        }
        dismiss(animated: true)
    }

    @objc private func uploadFeed() {
        guard let userId = Auth.auth().currentUser?.uid,
              let text = textView.text, !text.isEmpty,
              let imageData = imageView.image?.jpegData(compressionQuality: 0.8) else {
            return
        }

        let storageRef = Storage.storage().reference().child("feed_images/\(UUID().uuidString).jpg")

        storageRef.putData(imageData, metadata: nil) { _, error in
            if let error = error {
                print("이미지 업로드 실패: \(error.localizedDescription)")
                return
            }

            storageRef.downloadURL { url, error in
                guard let imageUrl = url?.absoluteString else { return }

                let feedData: [String: Any] = [
                    "userId": userId,
                    "text": text,
                    "imageUrl": imageUrl,
                    "timestamp": Date().timeIntervalSince1970
                ]

                Firestore.firestore().collection("feeds").addDocument(data: feedData) { error in
                    if let error = error {
                        print("피드 업로드 실패: \(error.localizedDescription)")
                    } else {
                        print("피드 업로드 성공")
                        self.navigationController?.popViewController(animated: true)
                    }
                }
            }
        }
    }
}
