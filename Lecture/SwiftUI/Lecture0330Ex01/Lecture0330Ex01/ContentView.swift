//
//  ContentView.swift
//  Lecture0330Ex01
//
//  Created by 심근웅 on 3/30/25.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var viewModel: CounterViewModel
    
    var body: some View {
        VStack(spacing: 20) {
            // ViewModel의 count 값을 화면에 표시
            Text("Count: \(viewModel.count)")
                .font(.largeTitle)
            
            // 버튼 클릭 시 count 값을 증가시킴
            Button("증가") {
                viewModel.count += 1
            }
            
            // NavigationLink: 버튼을 누르면 다음 화면(DetailView)으로 이동
            // DetailView에서도 동일한 viewModel을 공유함
            NavigationLink(destination: DetailView()) {
                Text("다음 화면으로 이동")
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
        .environmentObject(CounterViewModel())
}
