//
//  Lecture0210Ex01App.swift
//  Lecture0210Ex01
//
//  Created by 심근웅 on 2/10/25.
//

import SwiftUI

@main
struct Lecture0210Ex01App: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
