//
//  ContentView.swift
//  Lecture0212Ex02
//
//  Created by 심근웅 on 2/12/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            Text("내용")
//                .navigationTitle("홈 화면")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {
                            print("설정 버튼 클릭")
                        }) {
                            Image(systemName: "gear")
                        }
                    }
                }
        }
    }
}

#Preview {
    ContentView()
}
