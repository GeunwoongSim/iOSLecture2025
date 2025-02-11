//
//  practice02.swift
//  Lecture0211Ex01
//
//  Created by 심근웅 on 2/11/25.
//

import SwiftUI

struct practice02: View {
    var body: some View {
        Image("exampleImage")
            .resizable()
            .scaledToFit()
            .background(Color.gray)
            .clipShape(.circle)
            .frame(width: 200)
        
            .padding()
    }
}

#Preview {
    practice02()
}
