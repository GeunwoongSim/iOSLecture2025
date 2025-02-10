//import SwiftUI
//
//struct ArrayManagerView: View {
//    @State private var words: [String] = ["사과", "딸기", "바나나"]
//    @State private var newWord: String = ""
//    @State private var wordToDelete: String = ""
//    @State private var message: String = "단어를 추가 하세요"
//    
//    var body: some View {
//        VStack {
//            Text("Array 단어 관리 프로그램").font(.largeTitle).padding()
//            
//            HStack {
//                TextField("단어 입력", text: $newWord)
//                    .textFieldStyle(.roundedBorder)
//                Button("추가"){
//                    addWord()
//                }
//            }.padding()
//            
//            List(words, id: \.self) { word in
//                Text(word)
//            }
//            
//            HStack {
//                TextField("단어 삭제", text: $wordToDelete)
//                    .textFieldStyle(.roundedBorder)
//                Button("삭제"){
//                    deleteWord()
//                    print("삭제 버튼 누름",wordToDelete)
//                }
//            }.padding()
//        }.padding()
//        Text(message)
//            .foregroundStyle(.red)
//            .padding()
//    }
//    
//    func addWord(){
//        print("추가 버튼 누름",newWord)
//        words.append(newWord)
//        newWord = ""
//        message = "새 단어가 추가되었습니다."
//    }
//    func deleteWord(){
//        if let idx = words.firstIndex(of: wordToDelete) {
//            words.remove(at: idx)
//            message = "단어 목록에서 \(wordToDelete)를 삭제 했습니다"
//        }else {
//            message = "목록에 \(wordToDelete)는 없습니다"
//        }
//        wordToDelete = ""
//    }
//}
//
//#Preview {
//    ArrayManagerView()
//}
