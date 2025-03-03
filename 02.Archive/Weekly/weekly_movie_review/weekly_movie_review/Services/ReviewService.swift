import Foundation

class ReviewService {
    // 특정 영화의 리뷰를 UserDefaults에서 불러오는 함수
    static func loadReviews(for movieID: UUID) -> [Review] {
        let key = "reviews_\(movieID)" //영화별로 고유한 키 생성
        if let data = UserDefaults.standard.data(forKey: key),
           let savedReviews = try? JSONDecoder().decode([Review].self, from: data) {
            return savedReviews
        }
        return []
    }
    
    // 특정 영화의 리뷰를 UserDefaults에 저장하는 함수
    static func saveReviews(for movieID: UUID, reviews: [Review]) {
        let key = "reviews_\(movieID)" //영화별로 고유한 키 생성
        if let data = try? JSONEncoder().encode(reviews) {
            UserDefaults.standard.set(data, forKey: key) //JSON 데이터로 변환 후 저장
        }
    }
    // 리뷰추가하고 저장하는 함수
    static func addReview(for movieID: UUID, username: String, comment: String, rating: Int) {
        var reviews = loadReviews(for: movieID) // 기존 리뷰 불러오기
        let newReview = Review(movieID: movieID, username: username, comment: comment, rating: rating)
        reviews.append(newReview) // 리뷰 추가
        saveReviews(for: movieID, reviews: reviews) // 저장
    }
}


