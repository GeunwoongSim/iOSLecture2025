//
//  HomeView.swift
//  Lecture0211Ex04
//
//  Created by 심근웅 on 2/11/25.
//


import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            ProductListView()
//                .navigationTitle("과일마트")
        }
    }
}

#Preview {
    print(products)
    HomeView()
}
