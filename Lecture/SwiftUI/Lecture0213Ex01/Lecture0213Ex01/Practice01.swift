//
//  Practice01.swift
//  Lecture0213Ex01
//
//  Created by 심근웅 on 2/13/25.
//

import SwiftUI

struct Practice01: View {
    var body: some View {
        Button("Save"){
            save()
        }
        Button("Load"){
            load()
        }
    }
    func save(){
        let arrs: [String] = ["Apple", "Banana", "Cherry"]
        UserDefaults.standard.set(arrs, forKey: "arrs")
    }
    func load(){
        if let arrs = UserDefaults.standard.array(forKey: "arrs") as? [String] {
            print(arrs)
        }
    }
}

#Preview {
    Practice01()
}
