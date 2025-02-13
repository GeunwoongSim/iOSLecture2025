//
//  ContentView.swift
//  Lecture0213Ex03
//
//  Created by 심근웅 on 2/13/25.
//

import SwiftUI

struct ContentView: View {
    @State private var name: String = ""
    @State private var email: String = ""
    
    var body: some View {
        VStack{
            HStack {
                Text("이름: ")
                TextField(text: $name, label: {
                    Text("이 름")
                }).textFieldStyle(.roundedBorder)
            }
            HStack {
                Text("이메일: \(name)")
                TextField(text: $name, label: {
                    Text("이메일")
                })
                .textFieldStyle(.roundedBorder)
                .keyboardType(.emailAddress)
            }
        }.padding()
    }
}

#Preview {
    ContentView()
}
