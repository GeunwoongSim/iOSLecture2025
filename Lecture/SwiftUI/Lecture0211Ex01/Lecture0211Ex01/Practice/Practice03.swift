//
//  Practice03.swift
//  Lecture0211Ex01
//
//  Created by 심근웅 on 2/11/25.
//

import SwiftUI

struct Practice03: View {
    var body: some View {
        HStack{
            Text("Hello")
            Spacer()
            Text("World")
        }.padding()
        VStack{
            Text("SwiftUI")
                .padding(.bottom, 10)
            Text("레이아웃")
        }
        ZStack{
            Text("SwiftUI 연습")
        }.background(Color.blue)
    }
}

#Preview {
    Practice03()
}
