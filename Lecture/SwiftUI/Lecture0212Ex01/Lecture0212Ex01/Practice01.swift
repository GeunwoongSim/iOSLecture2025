//
//  Practice01.swift
//  Lecture0212Ex01
//
//  Created by 심근웅 on 2/12/25.
//

import SwiftUI

struct Practice01: View {
    @State var buttonText: String = "버튼이 클릭되지 않았습니다."
    var body: some View {
        Button(buttonText){
            buttonText = "버튼이 클릭되었습니다."
        }
        .padding()
        .frame(height: 50)
        .background(Color.blue)
        .foregroundStyle(Color.white)
        .cornerRadius(5)
        
    }
}

#Preview {
    Practice01()
}
