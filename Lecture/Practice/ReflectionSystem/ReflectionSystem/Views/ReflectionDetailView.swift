//
//  ReflectionDetailView.swift
//  ReflectionSystem
//
//  Created by 심근웅 on 2/14/25.
//

import SwiftUI

struct ReflectionDetailView: View {
    var reflection: Reflection
    
    var body: some View {
        GeometryReader{ geometry in
            HStack{
                Spacer()
                Text(reflection.content)
                    .font(.body)
                    .frame(width: geometry.size.width * 0.8, height: 50, alignment: .leading)
                    .background(Color.blue)
                    .background()
                Spacer()
            }
//            .background(Color.yellow)
            .navigationTitle(AppConstant.dateFormatter.string(from: reflection.date))
        }
    }
}

#Preview {
    ReflectionDetailView(reflection: Reflection(date: Date(), content: "회고 1"))
}
