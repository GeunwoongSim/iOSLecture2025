//
//  ProductListView.swift
//  Lecture0211Ex04
//
//  Created by 심근웅 on 2/11/25.
//


import SwiftUI

//struct ProductListView: View {
//    @ObservedObject var dataLoader: ProductDataLoader
//    var body: some View {
//        NavigationView {
//            List(dataLoader.products) { product in
//                NavigationLink {
//                    ProductDetailView(product: product)
//                } label: {
//                    ProductRow(product: product)
//                }
//            }
//            .navigationTitle("상품 목록")
//        }
//    }
//}
struct ProductListView: View {
    var products: [Product]
    var body: some View {
        NavigationView {
            List(products) { product in
                NavigationLink {
                    ProductDetailView(product: product)
                } label: {
                    ProductRow(product: product)
                }
            }
            .navigationTitle("상품 목록")
        }
    }
}
#Preview {
    @ObservedObject var dataLoader = ProductDataLoader()
    ProductListView(products: dataLoader.products)
}
