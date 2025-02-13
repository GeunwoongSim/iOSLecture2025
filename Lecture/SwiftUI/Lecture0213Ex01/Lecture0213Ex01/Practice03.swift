//
//  practice03.swift
//  Lecture0213Ex01
//
//  Created by 심근웅 on 2/13/25.
//

import SwiftUI

struct Practice03: View {
    @AppStorage("isDarkMode") private var isDarkMode: Bool = false
    @State var modeStr: String = ""
    var body: some View {
        Text(isDarkMode ? "다크모드" : "라이트모드")
        Toggle(isOn: $isDarkMode, label: {
            Text("다크 모드 설정")
        }).padding()
        Text(modeStr)
        Button("불러오기"){
            let check: Bool = UserDefaults.standard.bool(forKey: "isDarkMode")
            modeStr = check ? "다크" : "라이트"
        }
        
    }
}

#Preview {
    Practice03()
}
