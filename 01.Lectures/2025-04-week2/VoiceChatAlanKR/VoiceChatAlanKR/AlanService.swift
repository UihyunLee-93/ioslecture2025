import Foundation

class AlanService {
    static let shared = AlanService()

    private let baseURL = "https://kdt-api-function.azurewebsites.net/api/v1/question"

    // Alan 측에서 발급한 client ID (API Key 아님)
    private let clientID = UUID().uuidString
    private let apiKey = "72662b30-383a-4a0c-b07d-e24fc59322c9"
    func send(text: String, completion: @escaping (String) -> Void) {
        // URL 쿼리 인코딩 처리
        
        guard let encodedQuestion = text.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
              let url = URL(string: "\(baseURL)?content=\(encodedQuestion)&client_id=\(clientID)") else {
            completion("API URL 오류")
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"

        // 이 API는 Authorization 헤더 없이 동작함
        request.setValue("Bearer \(apiKey)", forHTTPHeaderField: "Authorization")

        URLSession.shared.dataTask(with: request) { data, _, _ in
            if let data = data,
               let json = try? JSONSerialization.jsonObject(with: data) as? [String: Any],
               let reply = json["content"] as? String {
                completion(reply)
            } else {
                completion("Alan 응답 오류")
            }
        }.resume()
    }
}

