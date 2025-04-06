import UIKit
import FirebaseFirestore

class FeedListViewController: UIViewController {
    private let tableView = UITableView()
    private var feeds: [(id: String, text: String, imageUrl: String)] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        fetchFeeds()
    }

    // UI 구성
    private func setupUI() {
        view.backgroundColor = .white
        title = "피드 목록"

        // 네비게이션 바에 입력 버튼 추가
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(addFeedTapped)
        )

        // 테이블뷰 설정
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "FeedCell")
        tableView.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(tableView)

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }

    // 피드 추가 버튼 누르면 FeedUploadViewController 실행
    @objc private func addFeedTapped() {
        let uploadVC = FeedUploadViewController()
        navigationController?.pushViewController(uploadVC, animated: true)
    }

    
    // 피드 추가 버튼을 누르면 알림창이 보인다(테스트 용)
//    @objc private func addFeedTapped() {
//        let alert = UIAlertController(title: "새 피드", message: "내용을 입력하세요", preferredStyle: .alert)
//        alert.addTextField { $0.placeholder = "피드 내용 입력" }
//
//        let addAction = UIAlertAction(title: "추가", style: .default) { [weak self] _ in
//            guard let self = self else { return }
//            let text = alert.textFields?.first?.text ?? ""
//            self.uploadFeed(text: text)
//        }
//
//        alert.addAction(addAction)
//        alert.addAction(UIAlertAction(title: "취소", style: .cancel))
//        present(alert, animated: true)
//    }

    // Firestore에 피드 업로드
    private func uploadFeed(text: String) {
        let data: [String: Any] = [
            "text": text,
            "imageUrl": ""  // 향후 이미지 업로드 기능 추가 가능
        ]

        Firestore.firestore().collection("feeds").addDocument(data: data) { error in
            if let error = error {
                print("피드 업로드 실패: \(error.localizedDescription)")
            } else {
                print("피드 업로드 성공")
            }
        }
    }

    // Firestore에서 피드 목록 불러오기
    private func fetchFeeds() {
        Firestore.firestore().collection("feeds")
            .addSnapshotListener { snapshot, error in
                guard let documents = snapshot?.documents, error == nil else {
                    print("Firestore 오류: \(error?.localizedDescription ?? "알 수 없는 오류")")
                    return
                }
                self.feeds = documents.compactMap { doc in
                    let id = doc.documentID
                    let text = doc["text"] as? String ?? "내용 없음"
                    let imageUrl = doc["imageUrl"] as? String ?? ""
                    return (id, text, imageUrl)
                }
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
    }
}

// MARK: - UITableViewDelegate & UITableViewDataSource
extension FeedListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return feeds.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let feed = feeds[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "FeedCell", for: indexPath)
        cell.textLabel?.text = feed.text
        return cell
    }
}

