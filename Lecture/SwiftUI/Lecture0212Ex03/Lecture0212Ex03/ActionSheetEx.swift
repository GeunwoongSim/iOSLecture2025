//
//  ActionSheetEx.swift
//  Lecture0212Ex03
//
//  Created by 심근웅 on 2/12/25.
//

import SwiftUI

struct ActionSheetEx: View {
    @State private var showActionSheet = false
    @State var someText: String = ""
    var body: some View {
        VStack {
            Text(someText)
            Button("Show ActionSheet") {
                showActionSheet = true
            }
            .actionSheet(isPresented: $showActionSheet) {
                ActionSheet(
                    title: Text("Select Option"),
                buttons: [
                    .default(Text("Option 1")),
                    .destructive(Text("Delete")),
                    .cancel()
                ])
            }
            
            
        }
        .padding()
    }
}

#Preview {
    ActionSheetEx()
}
