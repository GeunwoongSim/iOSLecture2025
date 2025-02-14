//
//  MainView.swift
//  ReflectionSystem
//
//  Created by 심근웅 on 2/14/25.
//

import SwiftUI

struct MainView: View {
    enum ViewType {
        case Reflection
        case Settings
    }
    
    @State private var viewType: ViewType = .Reflection
    
    var body: some View {
        TabView(selection: $viewType, content: {
            ContentView(system: ReflectionViewModel())
                .tag(ViewType.Reflection)
                .tabItem({
                    Label("회고", systemImage: "doc.fill").labelStyle(.iconOnly)
                })
            SettingsView()
                .tag(ViewType.Settings)
                .tabItem({
                    Label("설정", systemImage: "gearshape.fill").labelStyle(.iconOnly)
                })
        })
    }
}

#Preview {
    MainView()
}
