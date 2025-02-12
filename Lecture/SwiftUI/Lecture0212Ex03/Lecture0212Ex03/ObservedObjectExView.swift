//
//  ObservedObjectExView.swift
//  Lecture0212Ex03
//
//  Created by 심근웅 on 2/12/25.
//

import SwiftUI

class CntClass: ObservableObject{
    @Published var count: Int
    
    init(count: Int = 0) {
        self.count = count
    }
}

struct ObservedObjectExView: View {
    @ObservedObject var cntObj: CntClass = CntClass()
    @State var count: Int = 0
    var body: some View {
        VStack {
            Text("ObservedObjectExView")
                .font(.title)
                .padding()
            Text("Count: \(cntObj.count), \(count)")
            Button("증가하기"){
                print("증가하기 버튼 s클릭")
                cntObj.count += 1
                count += 1
            }
            .padding()
        }
        
    }
}

#Preview {
    ObservedObjectExView()
}
