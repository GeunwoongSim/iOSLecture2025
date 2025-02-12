//
//  Ex01.swift
//  Lecture0212Ex01
//
//  Created by 심근웅 on 2/12/25.
//

import SwiftUI

class CntClas {
    var count = 0
    init(_ count: Int) {
        self.count = count
    }
}

struct Ex01: View {
    
    var body: some View {
        TabView {
            homeView().tabItem{
                Label("홈", systemImage: "house.fill")
            }
            settingsView().tabItem{
                Label("설정", systemImage: "gearshape.fill")
            }
        }
    }
}

struct homeView: View {
    // 상태 변수 - 재 랜더링 된다.
//    @State var count: Int = 0
    //래퍼런스로 선언하고 래펀런스 필드를 변경한다
    var countRef: CntClas = CntClas(0)
    
    var body: some View {
        VStack {
            Text("home View")
            Button("버튼"){
                print("증가",countRef.count)
                countRef.count += 1
            }
        }
    }
}
struct settingsView: View {
    var body: some View {
        Text("settings")
    }
}

#Preview {
    Ex01()
}
