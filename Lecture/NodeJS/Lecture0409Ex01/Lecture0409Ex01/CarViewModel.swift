//
//  CarViewModel.swift
//  Lecture0409Ex01
//
//  Created by 심근웅 on 4/9/25.
//

import Foundation

class CarViewModel: ObservableObject {
  @Published var userData: UserData?
  @Published var carList: [Car] = []
  @Published var errorMessage: String?
  
  func fetchCarData(user: String, home: String) {
    guard let url = URL(string: "http://192.168.55.95:3000/api/home?user=\(user)&home=\(home)") else {
      errorMessage = "잘못된 URL입니다."
      return
    }
    
    URLSession.shared.dataTask(with: url) { data, response, error in
      if let error = error {
        DispatchQueue.main.async {
          self.errorMessage = "네트워크 오류: \(error.localizedDescription)"
        }
        return
      }
      
      guard let data = data else {
        DispatchQueue.main.async {
          self.errorMessage = "데이터가 없습니다."
        }
        return
      }
      
      do {
        let decoded = try JSONDecoder().decode(APIResponse.self, from: data)
        DispatchQueue.main.async {
          self.userData = decoded.userData
          self.carList = decoded.carList
          self.errorMessage = nil
        }
      } catch {
        DispatchQueue.main.async {
          self.errorMessage = "디코딩 오류: \(error.localizedDescription)"
        }
      }
    }.resume()
  }
}
