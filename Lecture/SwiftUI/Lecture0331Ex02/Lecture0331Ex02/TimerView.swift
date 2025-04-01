//
//  TimerView.swift
//  Lecture0331Ex02
//
//  Created by 심근웅 on 3/31/25.
//

import SwiftUI
import Combine

class ClockViewModel: ObservableObject {
    @Published var currentTime = Date()
    
    init() {
        Timer.publish(every: 1, on: .main, in: .common)
            .autoconnect()
            .assign(to: &$currentTime)
    }
}

struct TimerView: View {
    @StateObject var viewModel: ClockViewModel
    
    var body: some View {
        Text(viewModel.currentTime.formatted(
            date: .omitted,
            time: .standard)
        )
        .font(.largeTitle)
        .monospacedDigit() // 숫자 간격 고정
    }
}

#Preview {
    TimerView(viewModel: ClockViewModel())
}
