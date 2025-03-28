//
//  ReportView.swift
//  Lecture0327Ex02
//
//  Created by 심근웅 on 3/27/25.
//

import SwiftUI

struct ReportView: View {
    var body: some View {
        VStack(spacing: 12) {
            Text("주간 리포트")
                .font(.title2)
                .bold()
            Divider()
            Text("할 일 완료: 12개")
            Text("집중 시간: 7시간 45분")
            Text("새로운 목표: 3개")
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(.white)
                .shadow(radius: 3)
        )
    }
}

#Preview {
    ContentView()
}
