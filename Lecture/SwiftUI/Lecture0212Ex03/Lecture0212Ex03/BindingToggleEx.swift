//
//  BindingToggleEx.swift
//  Lecture0212Ex03
//
//  Created by 심근웅 on 2/12/25.
//

import SwiftUI

struct BindingToggleEx: View {
    @State private var isOn = false

    var body: some View {
        VStack{
            Text(isOn ? "isOn" : "isOff")
            ToggleView(isOn: $isOn).padding()  // @Binding 사용
        }
        
    }
}

struct ToggleView: View {
    @Binding var isOn: Bool

    var body: some View {
        Toggle("Switch", isOn: $isOn)
    }
}

#Preview {
    BindingToggleEx()
}
