//
//  HomeView.swift
//  Lecture0211Ex04
//
//  Created by 심근웅 on 2/11/25.
//


import SwiftUI

struct HomeView: View {
    @ObservedObject var dataLoader: ProductDataLoader
    var body: some View {
        NavigationView {
            ProductListView(products: dataLoader.products)
        }
    }
}

#Preview {
    HomeView(dataLoader: ProductDataLoader())
}
