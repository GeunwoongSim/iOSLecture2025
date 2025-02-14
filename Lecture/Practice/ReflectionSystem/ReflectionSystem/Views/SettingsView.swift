//
//  SettingsView.swift
//  ReflectionSystem
//
//  Created by 심근웅 on 2/14/25.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        Button(action: {
            NotificationManager.shared.requestPermission()
        }, label: {
            Text("알림 권한 요청")
        })
    }
}

#Preview {
    SettingsView()
}
