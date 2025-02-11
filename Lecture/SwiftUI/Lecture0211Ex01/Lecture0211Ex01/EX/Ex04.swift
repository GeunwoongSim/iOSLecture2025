//
//  Ex04.swift
//  Lecture0211Ex01
//
//  Created by 심근웅 on 2/11/25.
//

import SwiftUI

struct Ex04Detaiol: View {
    let fruit: String
    var body: some View {
        Text(fruit)
    }
}

struct Ex04: View {
    let fruits: [String] = ["Apple", "Banana", "Cherry", "Mango","Apple"]
    var body: some View {
        Text("과일 목록").font(.largeTitle)
        NavigationView{
            List(fruits, id: \.self){ fruit in
                NavigationLink{
                    Ex04Detaiol(fruit: fruit)
                } label: {
                    Text(fruit)
                }
            }.navigationTitle("이스트 과일")
        }
        
    }
}

#Preview {
    Ex04()
}
