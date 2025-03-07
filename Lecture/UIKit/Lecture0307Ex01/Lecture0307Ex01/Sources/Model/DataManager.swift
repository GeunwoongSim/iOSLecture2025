//
//  DataManager.swift
//  Lecture0307Ex01
//
//  Created by 심근웅 on 3/7/25.
//

import Foundation
import UIKit


class DataManager {
  static var shared: DataManager = DataManager()
  var users: [User] = [
    User(id: 1, name: "name1", email: "a@gmail.com"),
    User(id: 2, name: "name2", email: "b@gmail.com"),
    User(id: 3, name: "name3", email: "c@gmail.com")
  ]
  enum action {
    case fetchUser
  }
  func send(_ action: action) {
    switch action {
    case .fetchUser:
      self.fetchUsers()
    }
  }
  
  
}

extension DataManager {
  private func fetchUsers() {
    guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else {
      print("url 생성 실패")
      return
    }
    
    let task = URLSession.shared.dataTask(with: url) { data, response, error in
      if let error = error {
        print("네트워크 요청 실패: \(error.localizedDescription)")
        return
      }
      
      guard let data = data else {
        print("No Data")
        return
      }
      
      do {
        let decodedUsers = try JSONDecoder().decode([User].self, from: data)
        DispatchQueue.main.async {
          self.users = decodedUsers
        }
      }catch {
        print("Error - Decode Error: \(error)")
      }
    }
    task.resume()
  }
}
