//
//  AlanService.swift
//  Quotes
//
//  Created by Uihyun.Lee on 5/7/25.
//


import Foundation

class AlanService {
    @MainActor static let shared = AlanService()

    private let apiKey = "9b61d371-495d-479e-9835-c04ede19bb2e"
    // private let baseURL = "https://alan.estsoft.ai/api/v1/question"
    private let baseURL = "https://kdt-api-function.azurewebsites.net/api/v1/question"

    // 앱 실행 시 한 번 생성해서 계속 사용하는 client_id
    private let clientID = "9b61d371-495d-479e-9835-c04ede19bb2e"

    func sendCommand(_ userText: String, completion: @escaping (String?) -> Void) {
        // 질문 내용과 client_id를 URL 파라미터로 추가
        guard let encodedQuestion = userText.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
              let url = URL(string: "\(baseURL)?content=\(encodedQuestion)&client_id=\(clientID)") else {
            completion("API URL 오류")
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"  // Alan API는 GET을 사용

        request.addValue("Bearer \(apiKey)", forHTTPHeaderField: "Authorization")

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
