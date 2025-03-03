import Foundation

struct Movie: Codable {
  let id: String
  let title: String
  let director: String
  let releaseDate: String
  let genre: [String]
}

struct Review: Codable {
  var id: UUID = UUID()
  var movieID: String
//  var username: String
  var comment: String
  var rating: Int
}
