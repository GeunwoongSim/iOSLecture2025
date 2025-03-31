//
//  ContentView.swift
//  Lecture0331Ex01
//
//  Created by 심근웅 on 3/31/25.
//

import SwiftUI
import Combine

class ContentViewModel: ObservableObject {
    @Published var count: Int = 0
}

struct ContentView: View {
    @ObservedObject var viewModel: ContentViewModel
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Counter: \(viewModel.count)")
                .font(.title)
            Button("증가") {
                viewModel.count += 1
            }
            Button("감소") {
                viewModel.count -= 1
            }
        }
        .padding()
    }
}

#Preview {
    ContentView(viewModel: ContentViewModel())
}
