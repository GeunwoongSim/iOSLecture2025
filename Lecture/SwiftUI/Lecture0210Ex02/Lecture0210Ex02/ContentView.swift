//
//  ContentView.swift
//  Lecture0210Ex02
//
//  Created by 심근웅 on 2/10/25.
//

import SwiftUI

struct CustomButton: View {
    var title: String
    var action: ()->Void
    var body: some View {
        Button(title) {
            action()
        }
    }
}
struct CustomView: View {
    var body: some View {
        VStack {
            Text("기본 텍스트")
            Text("큰 글자").font(.largeTitle)
            Text("굵은 글자").bold()
            Text("기울어진 글자").italic()
            Text("밑줄 표시").underline().background(.green)
            Text("줄 간격 \n설정")
                .lineSpacing(20)
            Text("다양한 스타일 적용")
                .font(.title)
                .foregroundColor(.purple)
                .background(Color.yellow)
                .padding()
        }
    }
}

struct ContentView: View {
    var body: some View {
        CustomButton(title: "Click me", action: { print("Hello World!") })
        CustomView()
            .padding(30)
            .background(Color.gray)
    }
}

//#Preview {
//    ContentView()
//}
