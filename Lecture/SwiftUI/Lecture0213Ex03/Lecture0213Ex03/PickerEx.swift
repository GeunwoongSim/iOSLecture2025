//
//  PickerEx.swift
//  Lecture0213Ex03
//
//  Created by 심근웅 on 2/13/25.
//

import SwiftUI

struct PickerEx: View {
    @State private var selectedColor = "Red"
        let colors = ["Red", "Green", "Blue"]

        var body: some View {
            VStack {
                Text("선택한 색상: \(selectedColor)")
                Picker("색상 선택", selection: $selectedColor) {
                    ForEach(colors, id: \.self) {
                        Text($0)
                    }
                }
                .pickerStyle(.wheel)
//                .pickerStyle(SegmentedPickerStyle())
                .padding()
            }
        }
}

struct DatePickerExample: View {
    @State private var selectedDate = Date()

    var body: some View {
        VStack {
            Text("선택한 날짜: \(selectedDate, formatter: dateFormatter)")
            DatePicker("날짜 선택", selection: $selectedDate, displayedComponents: DatePickerComponents.date)
//                .datePickerStyle(GraphicalDatePickerStyle())
                .padding()
        }
    }

    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter
    }
}

#Preview {
    DatePickerExample()
}
