import Foundation
import Then

struct Movie: Codable {
  let id: String
  let title: String
  let director: String
  let releaseDate: String
  let genre: [String]
  var isFavorite: Bool
}

struct Review: Codable {
  var id: UUID = UUID()
  var movieID: String
//  var username: String
  var comment: String
  var rating: Int
}

class a: Then {
  var number1: Int
  init(number1: Int) {
    self.number1 = number1
  }
}
struct b: Then {
  var number1: Int
}
