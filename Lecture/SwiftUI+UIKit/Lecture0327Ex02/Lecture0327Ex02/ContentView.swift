//
//  ContentView.swift
//  Lecture0327Ex02
//
//  Created by 심근웅 on 3/27/25.
//

import SwiftUI

struct ContentView: View {
    @State private var showShare = false
    @State private var sharedImage: UIImage?
    
    var body: some View {
        VStack(spacing: 30) {
            ReportView()
            
            Button("리포트 공유하기") {
                let image = ReportView().snapshot()
                
                sharedImage = image
                showShare = true
            }
            .padding()
        }
        .sheet(isPresented: $showShare) {
            
            if let image = sharedImage {
                ActivityView(activityItems: [image])
            } else {
                let image = UIImage(systemName: "star.fill")
                ActivityView(activityItems: [image!])
            }
        }
        .padding()
    }
}
