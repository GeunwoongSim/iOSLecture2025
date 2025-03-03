//
//  Repository.swift
//  WeekAssign04
//
//  Created by 심근웅 on 2/28/25.
//

import Foundation


final class Repository {
  static var share: Repository = Repository() // 접근자
  private lazy var movieDB: [Movie] = []
  private lazy var reviewDB: [Review] = []
  
  // 초기에 정보를 불러옴
  init() {
    movieDB = moviesLoad()
    reviewDB = reviewsLoad()
  }
  var movies: [Movie] {
    return movieDB
  }
  var filterMovies: [Movie] {
    return movieDB.filter{ $0.isFavorite }
  }
  var reviews: [Review] {
    return reviewDB
  }
  enum action {
    case favoriteChange(id: String, isFavorite: Bool)
    case addReview(review: Review)
  }
  
  func send(_ action: action) {
    switch action {
    case .favoriteChange(let id, let isFavorite):
      movieDB[Int(id)! - 1].isFavorite = isFavorite
      self.moviesSave(movieDB) // 변경된 데이터를 저장
      
    case .addReview(let review):
      reviewDB.append(review)
      self.reviewsSave(reviewDB) // 추가된 리뷰 데이터를 저장
    }
  }
  
}

// MARK: private 함수 분리
extension Repository {
  // 영화 정보를 불러옴
  private func moviesLoad() -> [Movie] {
    var result: [Movie] = []
    guard let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("movies.json") else {
      print("경로 생성 불가")
      return []
    }
    do{
      let data = try Data(contentsOf: url)
      let arr = try JSONDecoder().decode([Movie].self, from: data)
      result = arr
    } catch {
      do {
        let url = Bundle.main.url(forResource: "movies", withExtension: "json")
        let data = try Data(contentsOf: url!)
        let arr = try JSONDecoder().decode([Movie].self, from: data)
        result = arr
      } catch {
        fatalError()
      }
    }
    return result
  }
  
  // 영화 정보를 저장
  private func moviesSave(_ data: [Movie]) {
    guard let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("movies.json") else {
      print("세이브 경로 생성 실패")
      return
    }
    do{
      try JSONEncoder().encode(data).write(to: url)
    } catch {
      print(error)
    }
  }
  
  // 리뷰 정보를 불러옴
  private func reviewsLoad() -> [Review] {
    guard let data: Data = UserDefaults.standard.value(forKey: "reviews") as? Data,
          let reviews = try? JSONDecoder().decode([Review].self, from: data) else {
      return []
    }
    return reviews
  }
  
  // 리뷰 정보를 저장
  private func reviewsSave(_ data: [Review]) {
    guard let data = try? JSONEncoder().encode(data) else {
      return
    }
    UserDefaults.standard.setValue(data, forKey: "reviews")
  }
}
