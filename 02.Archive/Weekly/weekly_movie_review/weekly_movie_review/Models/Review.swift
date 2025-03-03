import Foundation

struct Review: Codable {
    var id: UUID = UUID()
    var movieID: UUID
    var username: String
    var comment: String
    var rating: Int
}
