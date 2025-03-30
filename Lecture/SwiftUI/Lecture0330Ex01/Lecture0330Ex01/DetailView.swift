//
//  DetailView.swift
//  Lecture0330Ex01
//
//  Created by 심근웅 on 3/30/25.
//

import Foundation
import SwiftUI
import Combine

struct DetailView: View {
    
    @EnvironmentObject var viewModel: CounterViewModel
    
    var body: some View {
        VStack {
            Text("상세화면입니다.")
            Text("현재 Count: \(viewModel.count)")
            Button("감소") {
                viewModel.count -= 1
            }
        }
    }
}


#Preview {
    DetailView()
        .environmentObject(CounterViewModel())
}

