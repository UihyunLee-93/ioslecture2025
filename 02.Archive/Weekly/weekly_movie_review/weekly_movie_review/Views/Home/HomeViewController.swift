import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    
    //var collectionView: UICollectionView!
    var movies: [Movie] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
                layout.estimatedItemSize = .zero //자동 크기 조정 기능 비활성화
            }
        setupCollectionView()
        loadMovies()
    }
    
    func setupCollectionView() {
        
     
            let layout = UICollectionViewFlowLayout()

            let spacing: CGFloat = 10 //좌우 여백 설정
            let cellSpacing: CGFloat = 5 // 포스터 간 간격 추가 (조절 가능)
            let totalSpacing = (spacing * 2) + (cellSpacing * 2) //좌우 여백 + 셀 사이 여백

            let cellWidth = (view.frame.width - totalSpacing) / 3 // 한 줄에 3개 배치
            let cellHeight = cellWidth * 3 / 2 // 2:3 비율 유지

            layout.itemSize = CGSize(width: cellWidth, height: cellHeight)
            layout.minimumInteritemSpacing = cellSpacing //포스터 간 가로 간격 추가
            layout.minimumLineSpacing = spacing // 포스터 간 세로 간격 추가
            layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)

     
        
        collectionView.collectionViewLayout = layout
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        
        let nib = UINib(nibName: "MovieCollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "MovieCell")
    }
    func loadMovies() {
        movies = MovieService.loadMovies() //movieService 클래스분리
        collectionView.reloadData()
    }
}

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieCell", for: indexPath) as! MovieCollectionViewCell
        let movie = movies[indexPath.row]
        
        cell.configure(with: movie)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            let selectedMovie = movies[indexPath.row]
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            if let detailVC = storyboard.instantiateViewController(withIdentifier: "MovieDetailViewController") as? MovieDetailViewController {
                detailVC.movie = selectedMovie // 영화 정보전달
                navigationController?.pushViewController(detailVC, animated: true) //화면 이동
            }
        }
}


