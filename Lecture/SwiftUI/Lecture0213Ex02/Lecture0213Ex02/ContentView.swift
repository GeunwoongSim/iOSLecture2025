
import SwiftUI

struct ContentView: View {
    @State private var users: [User] = []
    
    var body: some View {
        Text("사용자 목록").font(.largeTitle)
        VStack {
            List{
                ForEach(users, content: { user in
                    Text("이름: \(user.name)")
                    Text("나이: \(user.age)")
                })
            }
            Button("저장하기") {
                saveSampleUsers()
            }
            Button("불러오기") {
                loadSavedUsers()
            }
        }
    }
    func saveSampleUsers() {
        let sampleUsers = [
            User(id: UUID(), name: "김범준", age: 25),
            User(id: UUID(), name: "장범준", age: 30),
            User(id: UUID(), name: "홍길동", age: 32),
            User(id: UUID(), name: "배철수", age: 45),
            User(id: UUID(), name: "테스트", age: 98)
        ]
        FileManagerHelper.shared.saveUser(sampleUsers)
    }
    func loadSavedUsers() {
        users = FileManagerHelper.shared.loadUser()
    }
}


#Preview {
    ContentView()
}
