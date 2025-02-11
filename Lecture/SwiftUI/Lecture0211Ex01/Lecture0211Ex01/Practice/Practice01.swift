//
//  Practice01.swift
//  Lecture0211Ex01
//
//  Created by 심근웅 on 2/11/25.
//

import SwiftUI

struct Practice01: View {
    var body: some View {
        VStack {
            Text("SwiftUI 실습")
                .font(.largeTitle)
                .foregroundStyle(.red)
                
                .overlay{
                    RoundedRectangle(cornerRadius: 10).stroke(.blue,lineWidth: 4)
                }
                .background(.yellow)
        }.padding()
    }
}

#Preview {
    Practice01()
}
