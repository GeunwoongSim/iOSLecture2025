//
//  CarListView.swift
//  Lecture0409Ex02
//
//  Created by 심근웅 on 4/9/25.
//

import Foundation
import SwiftUI

struct CarListView: View {
    let user: String
    let home: String
    @ObservedObject var viewModel: CarViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("사용자: \(user), 지역: \(home)")
                .font(.headline)
                .padding()
            
            List {
                ForEach(viewModel.carList) { car in
                    VStack(alignment: .leading) {
                        Text("\(car.name) (\(car.company))").font(.headline)
                        Text("가격: \(car.price)만 원 / 연식: \(car.year)년").font(.subheadline)
                    }
                }
                .onDelete(perform: delete)
            }
        }
        .navigationTitle("자동차 리스트")
        .navigationBarItems(
            trailing: NavigationLink(
                destination: CarFormView(
                    viewModel: viewModel
                )
            ) {
            Text("추가")
            }
        )
        .onAppear {
            viewModel.fetchCarData(user: user, home: home)
        }
    }
    
    func delete(at offsets: IndexSet) {
        for index in offsets {
            let car = viewModel.carList[index]
            viewModel.deleteCar(id: car.id)
        }
    }
}
