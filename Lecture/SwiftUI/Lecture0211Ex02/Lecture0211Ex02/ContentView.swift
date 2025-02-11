//
//  ContentView.swift
//  Lecture0211Ex02
//
//  Created by 심근웅 on 2/11/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            Button("확 인"){
                test()
            }
        }
        .padding()
    }
    func test() {
//        print("JSON 데이터 변환 예제")
        print(fruitsList)
    }
}

#Preview {
    ContentView()
}
