//
//  Practice01.swift
//  Lecture0210Ex03
//
//  Created by 심근웅 on 2/10/25.
//

import SwiftUI

struct Practice01: View {
    @State private var wordNum: Int = 0
    @State private var db: [String] = ["사과","딸기","바나나"]
    @State private var insertWord: String = ""
    @State private var deleteWord: String = ""
    @State private var searchWord: String = ""
    @State private var message: String = ""
    
    var body: some View {
        VStack {
            Text("Array 관리 프로그램").font(.largeTitle)
            Text("현재 단어 수 : \(db.count)개").font(.title3)
            HStack {
                TextField("단어 입력", text: $insertWord).textFieldStyle(.roundedBorder)
                Button("추가") { insertDB() }
            }
            List(db, id: \.self, rowContent: { word in
                Text(word)
            })
            HStack {
                TextField("삭제할 단어 입력", text: $deleteWord).textFieldStyle(.roundedBorder)
                Button("삭제") { deleteDB() }
            }
            HStack {
                TextField("검색할 단어 입력", text: $searchWord).textFieldStyle(.roundedBorder)
                Button("검색") { searchDB() }
            }
            Text(message).font(.title3).foregroundStyle(.red)
        }.padding()
    }
    func insertDB() {
        if insertWord == "" {
            message = "입력된 값이 없습니다."
            return
        }
        guard let idx: Int = db.firstIndex(of: insertWord) else {
            // 등록된 값이 존재
            return
        }
        db.append(insertWord)
    }
    func deleteDB() {
        print(deleteWord)
    }
    func searchDB() {
        print(searchWord)
    }

}


#Preview {
    Practice01()
}
