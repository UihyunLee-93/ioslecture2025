import Foundation

struct Movie: Codable {
    let id: UUID
    let title: String
    let poster: String
    let description: String
    //let favorite: Bool //미구현
}
