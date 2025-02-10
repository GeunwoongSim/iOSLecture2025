//  ContentView.swift
//  DayAssign04_0210

import SwiftUI

struct ContentView: View {
    @State private var wordNum: Int = 0
    @State private var db: [String] = ["사과","딸기","바나나"]
    @State private var insertWord: String = ""
    @State private var deleteWord: String = ""
    @State private var searchWord: String = ""
    @State private var message: String = "메세지를 표시합니다"
    
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
        guard let _: Int = db.firstIndex(of: insertWord) else {
            db.append(insertWord)
            message = "단어가 저장되었습니다."
            insertWord = ""
            return
        }
        message = "등록된 단어입니다."
        insertWord = ""
    }
    func deleteDB() {
        if deleteWord == "" {
            message = "입력된 값이 없습니다."
            return
        }
        guard let idx: Int = db.firstIndex(of: deleteWord) else {
            message = "단어가 목록에 없습니다."
            deleteWord = ""
            return
        }
        db.remove(at: idx)
        message = "단어가 삭제되었습니다."
        deleteWord = ""
    }
    func searchDB() {
        if searchWord == "" {
            message = "입력된 값이 없습니다."
            searchWord = ""
            return
        }
        guard let idx: Int = db.firstIndex(of: searchWord) else {
            message = "단어가 목록에 없습니다."
            searchWord = ""
            return
        }
        message = "단어의 위치는 \(idx)번째 입니다."
        searchWord = ""
    }

}

#Preview {
    ContentView()
}
