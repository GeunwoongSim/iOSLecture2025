//import SwiftUI
//
//struct ArrayManagerView: View {
//    
//    @State private var db: [String] = ["안녕","사과"]
//    @State private var upWord: String = ""
//    @State private var deleteWord: String = ""
//    @State private var message: String = ""
//    @State private var wordNum: Int = 0
//    var body: some View {
//        VStack {
//            Text("Array 관리 프로그램").font(.largeTitle)
//            HStack {
//                TextField("추가/검색 단어 입력", text: $upWord).textFieldStyle(.roundedBorder)
//                Button("추가"){ insertDB() }.padding()
//                Button("찾기"){ searchDB() }.padding()
//            }
//            List(db, id: \.self) { Text($0) }
//            HStack {
//                TextField("삭제할 단어 입력", text: $deleteWord).textFieldStyle(.roundedBorder)
//                Button("삭제"){ deleteDB() }.padding()
//            }
//            HStack {
//                Text(message).foregroundStyle(.red)
//                Button("단어 수"){ loadWordsCount() }
//            }
//        }.padding().animation(.easeInOut, value: db)
//    }
//    
//    func insertDB() {
//        guard let _ = db.firstIndex(of: upWord) else {
//            db.append(upWord)
//            message = "\(upWord) 을(를) 목록에 추가 했습니다."
//            upWord = ""
//            return
//        }
//        message = "이미 존재하는 단어입니다."
//        upWord = ""
//    }
//    func deleteDB() {
//        guard let idx = db.firstIndex(of: deleteWord) else {
//            message = "\(deleteWord) 이(가) 목록에 없습니다."
//            deleteWord = ""
//            return
//        }
//        db.remove(at: idx)
//        message = "\(deleteWord) 을(를) 목록에서 삭제 했습니다."
//        deleteWord = ""
//    }
//    func loadWordsCount() {
//        message = "현재 단어 수: \(db.count)개"
//    }
//    func searchDB() {
//        guard let idx = db.firstIndex(of: upWord) else {
//            message = "\(upWord) 이(가) 목록에 없습니다."
//            upWord = ""
//            return
//        }
//        message = "\(upWord) 은 배열의 \(idx+1)번째 위치에 있습니다."
//    }
//}
//
//#Preview {
//    ArrayManagerView()
//}

