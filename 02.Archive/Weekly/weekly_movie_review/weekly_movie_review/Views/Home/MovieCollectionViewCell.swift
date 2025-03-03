import UIKit

class MovieCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        posterImageView.contentMode = .scaleAspectFill //포스터 크기에 맞게 꽉 채움
       
    }


    func configure(with movie: Movie) {
        if let image = UIImage(named: movie.poster) {
            posterImageView.image = image
        } else {
            print("이미지 로드 실패: \(movie.poster)")
        }
        titleLabel.text = movie.title
    }
}
