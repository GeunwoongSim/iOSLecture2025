//
//  Repository.swift
//  WeekAssign04
//
//  Created by 심근웅 on 2/28/25.
//

import Foundation


final class Repository {
  static var share: Repository = Repository()
  lazy var dbs: [Movie] = jsonLoad("movies")
  lazy var reviews: [Review] = reviewsLoad()
  
  func jsonLoad<T: Decodable>(_ fileName: String) -> T { // JSON의 정보를 받아옴
    guard let url = Bundle.main.url(forResource: fileName, withExtension: "json"),
          let data = try? Data(contentsOf: url),
          let arr = try? JSONDecoder().decode(T.self, from: data)
    else { fatalError("JSON 파일의 데이터 불러오기 실패") }
    return arr
  }
  
  func reviewsLoad() -> [Review] {
    guard let data: Data = UserDefaults.standard.value(forKey: "reviews") as? Data,
          let reviews = try? JSONDecoder().decode([Review].self, from: data) else {
      return []
    }
    return reviews
  }
  func reviewsSave() {
    guard let data = try? JSONEncoder().encode(reviews) else {
      return
    }
    UserDefaults.standard.setValue(data, forKey: "reviews")
  }
}

