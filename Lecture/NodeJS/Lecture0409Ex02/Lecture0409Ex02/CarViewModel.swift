//
//  CarViewModel.swift
//  Lecture0409Ex02
//
//  Created by 심근웅 on 4/9/25.
//

import Foundation
let baseURL: String = "http://192.0.0.2:3000/api"


class CarViewModel: ObservableObject {
    @Published var userData: UserData?
    @Published var carList: [Car] = []
    @Published var errorMessage: String?
    
    func fetchCarData(user: String, home: String) {
        guard let url = URL(string: "\(baseURL)/home?user=\(user)&home=\(home)") else {
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
            
            // guard let data = data else { return }
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
    
    // 자동차 삭제
    func deleteCar(id: String) {
        guard let url = URL(string: "\(baseURL)/cars/\(id)") else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "DELETE"
        
        URLSession.shared.dataTask(with: request) { _, response, error in
            DispatchQueue.main.async {
                if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 {
                    self.carList.removeAll { $0.id == id }
                } else {
                    self.errorMessage = "삭제 실패"
                }
            }
        }.resume()
    }
    
    // 자동차 추가
    func addCar(_ car: Car) {
        guard let url = URL(string: "\(baseURL)/cars") else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        do {
            let jsonData = try JSONEncoder().encode(car)
            request.httpBody = jsonData
        } catch {
            DispatchQueue.main.async {
                self.errorMessage = "인코딩 오류"
            }
            return
        }
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let httpResponse = response as? HTTPURLResponse else { return }
            DispatchQueue.main.async {
                if httpResponse.statusCode == 201 {
                    self.carList.append(car)
                } else {
                    self.errorMessage = "등록 실패 (Status: \(httpResponse.statusCode))"
                }
            }
        }.resume()
    }
}
