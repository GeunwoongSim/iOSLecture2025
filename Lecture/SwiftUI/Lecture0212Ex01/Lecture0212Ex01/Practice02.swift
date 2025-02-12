//
//  Practice02.swift
//  Lecture0212Ex01
//
//  Created by 심근웅 on 2/12/25.
//

import SwiftUI

struct Practice02: View {
    @State var cnt: Int = 0
    var body: some View {
        NavigationView{
            VStack {
                Text("이동")
                NavigationLink(destination: {
                    naviLinkView()
                }, label: {
                    Label("세부 화면 이동", systemImage: "house.fill" )
                })
                .navigationTitle("메인 화면")
//                .labelStyle(.iconOnly)
            }
//            .background(Color.blue)
        }
    }
}
struct naviLinkView: View {
    var body: some View{
        Text("여기는 세부 화면입니다.")
    }
}
#Preview {
    Practice02()
}
