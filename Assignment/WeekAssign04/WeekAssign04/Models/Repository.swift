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
    
    if let url = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true).appendingPathComponent("movies.json"),
       let data = try? Data(contentsOf: url),
       let arr = try? JSONDecoder().decode(T.self, from: data) {
      return arr
    }else {
      if let url = Bundle.main.url(forResource: "movies.json", withExtension: nil),
         let data = try? Data(contentsOf: url),
         let arr = try? JSONDecoder().decode(T.self, from: data) {
        return arr
      }
    }
    return [] as! T
  }
  
  func jsonSave(_ fileName: String) {
    guard let url = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true).appendingPathComponent("movies.json") else {
      print("세이브 경로 생성 실패")
      return
    }
    do{
      try JSONEncoder().encode(dbs).write(to: url)
    } catch {
      print(error)
    }
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

