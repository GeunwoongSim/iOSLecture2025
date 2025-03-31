//
//  Lecture0331Ex02App.swift
//  Lecture0331Ex02
//
//  Created by 심근웅 on 3/31/25.
//

import SwiftUI

@main
struct Lecture0331Ex02App: App {
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: UserViewModel())
        }
    }
}
