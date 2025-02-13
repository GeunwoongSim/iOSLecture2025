//
//  Practice02.swift
//  Lecture0213Ex01
//
//  Created by 심근웅 on 2/13/25.
//

import SwiftUI

struct User: Codable {
    var name: String
    var age: Int
}

struct Practice02: View {
    var body: some View {
        Button("Save"){
            save()
        }
        Button("Load"){
            load()
        }
    }
    func save(){
        let user = User(name: "geun", age: 28)
        do {
            let user = try JSONEncoder().encode(user)
            UserDefaults.standard.set(user, forKey: "user")
        } catch {
            print("encode 못함")
        }
//        if let user = try? JSONEncoder().encode(user) {
//            UserDefaults.standard.set(user, forKey: "user")
//        }
    }
    func load(){
        guard let data = UserDefaults.standard.data(forKey: "user") else {
            print("유저 정보를 못받아옴")
            return
        }
        do {
            let user = try JSONDecoder().decode(User.self, from: data)
            print(user)
        } catch {
            print("JSON 데이터를 변수로 변환 실패")
        }
//        if let data = UserDefaults.standard.data(forKey: "user"), let user = try? JSONDecoder().decode(User.self, from: data) {
//            print(user)
//        }
    }
}

#Preview {
    Practice02()
}
