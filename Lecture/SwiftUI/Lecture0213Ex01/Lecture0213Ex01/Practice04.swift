//
//  Practice04.swift
//  Lecture0213Ex01
//
//  Created by 심근웅 on 2/13/25.
//

import SwiftUI

struct Practice04: View {
    @AppStorage("userName") private var userName: String = ""
    var body: some View {
        VStack(alignment: .leading){
            Text("안녕하세요 \(userName)님")
            TextField(text: $userName, label: {
                Text("사용자 이름")
            }).textFieldStyle(.roundedBorder)
        }.padding()
    }
}

#Preview {
    Practice04()
}
