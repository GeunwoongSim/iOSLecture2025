//
//  ReflectionView.swift
//  ReflectionSystem
//
//  Created by 심근웅 on 2/14/25.
//

import SwiftUI

struct ReflectionView: View {
    @State private var content: String = ""
    @EnvironmentObject var viewModel: ReflectionViewModel
    
    var body: some View {
        VStack {
            TextEditor(text: $content)
                .frame(height: 200)
                .border(Color.gray)
                .padding()
            Button(action:{
                let newReflection = Reflection(date: Date(), content: content)
                viewModel.reflections.append(newReflection)
                viewModel.reflectionsSave()
                content = ""
            }, label: {
                Text("저장하기")
                    .padding()
                    .background(Color.blue)
                    .foregroundStyle(Color.white)
                    .cornerRadius(10)
            })
        }
    }
}

#Preview {
    ReflectionView().environmentObject(ReflectionViewModel())
}
