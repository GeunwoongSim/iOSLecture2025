//
//  Ex5.swift
//  Lecture0211Ex01
//
//  Created by 심근웅 on 2/11/25.
//

import SwiftUI

struct Ex05: View {
    var body: some View {
        VStack {
            HStack {
                Text("이름")
                Text("심근웅")
            }
            
            ZStack {
                Text("중첩된 ZStack")
                    .background(Color.gray)
                    .foregroundStyle(Color.white)
            }
        }
        
        
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    Ex05()
}
