import SwiftUI

struct User: Codable {
    var id: UUID
    var name: String
    var age: Int
}
class FileManagerHelper {
    static let shared = FileManagerHelper()
    
    
    let fileName = "users.json"
    
    func saveUsers(_ users: [User]) {
            // Document 디렉토리의 경로를 가져옴 (앱 전용 사용자 데이터 저장 경로)
            let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
            let fileURL = documentDirectory.appendingPathComponent(fileName)  // 파일 경로 생성

            let encoder = JSONEncoder()  // JSON 인코더 생성
            if let data = try? encoder.encode(users) {  // users 배열을 JSON 데이터로 변환
                do {
                    try data.write(to: fileURL)  // 데이터를 파일에 저장
                    print("데이터 저장 성공: \(fileURL)")  // 저장 성공 메시지 출력
                } catch {
                    print("저장 실패: \(error)")  // 저장 실패 시 오류 메시지 출력
                }
            }
        }

        // JSON 파일에서 User 배열을 불러오는 메서드
        func loadUsers() -> [User] {
            // Document 디렉토리의 경로와 저장된 파일의 경로 생성
            let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
            let fileURL = documentDirectory.appendingPathComponent(fileName)

            if let data = try? Data(contentsOf: fileURL) {  // 파일에서 데이터를 읽어옴
                let decoder = JSONDecoder()  // JSON 디코더 생성
                if let users = try? decoder.decode([User].self, from: data) {  // JSON 데이터를 User 배열로 변환
                    print("데이터 불러오기 성공")
                    return users  // 변환된 User 배열 반환
                }
            }
            print("데이터 불러오기 실패")
            return []  // 데이터 불러오기 실패 시 빈 배열 반환
        }
    }

