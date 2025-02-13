//
//  ContentView.swift
//  Lecture0213Ex01
//
//  Created by 심근웅 on 2/13/25.
//

import SwiftUI

struct ContentView: View {
    @State private var username: String = ""
    @State private var userage: String = ""
    @State private var isDarkmode: Bool = false
    
    // MARK: - body 함수
    var body: some View {
        NavigationView{
            List {
                Section(header: Text("사용자 정보 입력").bold()){
                    TextField(text: $username, label: {
                        Text("이름")
                    })
                    TextField(text: $userage, label: {
                        Text("나이")
                    })
                }
                Section(header: Text("다크 모드 설정").bold()){
                    HStack{
                        Toggle(isOn: $isDarkmode, label: {
                            Text("다크 모드 활성화")
                        })
                    }
                }
                Section{
                    Button(action:{
                        saveData()
                    },label: {
                        Text("데이터 저장하기")
                    })
                    Button(action:{
                        loadData()
                    },label: {
                        Text("데이터 불어오기")
                    })
                }
            }
            .navigationTitle("UserDeafults 실습")
        }
    } // end of body
}

extension ContentView {
    // MARK: - 저장 기능
    func saveData() {
        UserDefaults.standard.set(username, forKey: "username")
        if let age = Int(userage) {
            UserDefaults.standard.set(age, forKey: "userage")
        }
        UserDefaults.standard.set(isDarkmode, forKey: "isDarkmode")
    }
    // MARK: - 불러오기 기능
    func loadData() {
        username = UserDefaults.standard.string(forKey: "username") ?? "Unknown"
        userage = "\(UserDefaults.standard.integer(forKey: "userage"))"
        isDarkmode = UserDefaults.standard.bool(forKey: "isDarkmode")
    }
} // end of extension

#Preview {
    ContentView()
}
