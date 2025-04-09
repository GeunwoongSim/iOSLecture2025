//
//  CaroFormView.swift
//  Lecture0409Ex02
//
//  Created by 심근웅 on 4/9/25.
//

import Foundation
import SwiftUI

struct CarFormView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var viewModel: CarViewModel
    
    @State private var id = ""
    @State private var name = ""
    @State private var price = ""
    @State private var year = ""
    @State private var company = ""
    
    var body: some View {
        Form {
            TextField("ID", text: $id)
            TextField("이름", text: $name)
            TextField("가격", text: $price).keyboardType(.numberPad)
            TextField("연식", text: $year).keyboardType(.numberPad)
            TextField("회사", text: $company)
            
            Button("등록") {
                if let priceInt = Int(price), let yearInt = Int(year) {
                    let car = Car(id: id, name: name, price: priceInt, year: yearInt, company: company)
                    viewModel.addCar(car)
                    dismiss()
                }
            }
        }
        .navigationTitle("자동차 등록")
    }
}

