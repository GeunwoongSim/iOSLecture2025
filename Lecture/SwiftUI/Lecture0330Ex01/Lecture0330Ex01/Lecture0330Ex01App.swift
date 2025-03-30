//
//  Lecture0330Ex01App.swift
//  Lecture0330Ex01
//
//  Created by 심근웅 on 3/30/25.
//

import SwiftUI

@main
struct Lecture0330Ex01App: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
            .environmentObject(CounterViewModel())
        }
    }
}
