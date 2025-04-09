//
//  ContentView.swift
//  Lecture0409Ex02
//
//  Created by 심근웅 on 4/9/25.
//

import SwiftUI

struct ContentView: View {
    @State private var username = ""
    @State private var userHome = ""
    @StateObject private var viewModel = CarViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("사용자 이름", text: $username)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
                
                TextField("사는 곳", text: $userHome)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
                
                NavigationLink("자동차 리스트로 이동") {
                    CarListView(user: username, home: userHome, viewModel: viewModel)
                }
                .padding()
                
                Spacer()
            }
            .navigationTitle("홈 입력")
        }
    }
}

#Preview {
    ContentView()
}
