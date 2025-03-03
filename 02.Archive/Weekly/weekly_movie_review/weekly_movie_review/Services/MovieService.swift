import Foundation

class MovieService {
    static func loadMovies() -> [Movie] {
        guard let url = Bundle.main.url(forResource: "movies", withExtension: "json") else {
            print("movies.json 파일을 찾을 수 없음")
            return []
        }

        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            return try decoder.decode([Movie].self, from: data)
        } catch {
            print("JSON 오류: \(error.localizedDescription)")
            return []
        }
    }
}
