import UIKit

class MovieDetailViewController: UIViewController {
    var movie: Movie?
    var reviews: [Review] = []
    var selectedRating: Int = 3
    
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupNavigationBar()
        loadReviews() //저장된 리뷰 불러오기
    }
    
    func setupUI() {
        guard let movie = movie else { return }
        titleLabel.text = movie.title
        descriptionLabel.text = movie.description
        posterImageView.image = UIImage(named: movie.poster)
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
    }
    
    func setupNavigationBar() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "리뷰 작성",
            style: .plain,
            target: self,
            action: #selector(addReview)
        )
    }
    
    
    func loadReviews() {
        guard let movie = movie else { return }
        reviews = ReviewService.loadReviews(for: movie.id) //Service 호출
        tableView.reloadData()
    }
    
    func saveReviews() {
        guard let movie = movie else { return }
        ReviewService.saveReviews(for: movie.id, reviews: reviews) //Service 호출
    }
    
    // 리뷰 추가 및 저장
    @objc func addReview() {
        let alert = UIAlertController(title: "리뷰 작성", message: "이름과 리뷰를 입력하세요", preferredStyle: .alert)
        
        alert.addTextField { textField in
            textField.placeholder = "이름"
        }
        
        alert.addTextField { textField in
            textField.placeholder = "리뷰 내용"
        }
        
        //별점 선택 액션시트 추가
        let ratingAlert = UIAlertController(title: "별점 선택", message: "별점을 선택하세요", preferredStyle: .actionSheet)
        
        for i in 1...5 {
            let action = UIAlertAction(title: String(repeating: "⭐️", count: i), style: .default) { _ in
                self.selectedRating = i // 선택한 별점을 저장
                alert.message = "별점: " + String(repeating: "⭐️", count: i) // 선택한 별점 표시
                self.present(alert, animated: true, completion: nil) // 리뷰 입력 화면 다시 표시
            }
            ratingAlert.addAction(action)
        }
        
        let submitAction = UIAlertAction(title: "저장", style: .default) { _ in
            if let username = alert.textFields?[0].text, !username.isEmpty,
               let reviewText = alert.textFields?[1].text, !reviewText.isEmpty,
               let movie = self.movie {
                
                ReviewService.addReview(for: movie.id, username: username, comment: reviewText, rating: self.selectedRating) //ReviewService에서 처리
                self.reviews = ReviewService.loadReviews(for: movie.id) //리뷰 로드
                self.tableView.reloadData()
            }
        }
        
        let cancelAction = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        
        alert.addAction(UIAlertAction(title: "별점 선택", style: .default) { _ in
            self.present(ratingAlert, animated: true, completion: nil) // 별점 선택 화면 표시
        })
        
        alert.addAction(submitAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true, completion: nil)
    }
    
    
}


//테이블 뷰 구현
extension MovieDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reviews.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReviewCell") ?? UITableViewCell(style: .subtitle, reuseIdentifier: "ReviewCell")
        
        let review = reviews[indexPath.row]
        let stars = String(repeating: "⭐️", count: review.rating) //별점 개수만큼 별 추가
        
        cell.textLabel?.text = "\(review.username) : \(stars)" // 작성자 + 별점
        cell.detailTextLabel?.text = review.comment // 리뷰 내용 표시
        
        return cell
    }
}
