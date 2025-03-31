//
//  ContentView.swift
//  Lecture0331Ex02
//
//  Created by 심근웅 on 3/31/25.
//

import SwiftUI
import Combine

struct User: Decodable, Identifiable {
    var id: Int
    var name: String
}

class UserViewModel: ObservableObject {
    @Published var users: [User] = []
    
    private var cancellables = Set<AnyCancellable>()
    
    func fetchUsers() {
        guard let url = URL(
            string: "https://jsonplaceholder.typicode.com/users"
        ) else { return }
        
        // 데이터 요청 자체가 스트림으로 동작
        URLSession.shared.dataTaskPublisher(for: url)
            // 받은 응답(data, response)중 data만 사용
            .map(\.data)
            // JSON 데이터를 [User]의 형태로 변환
            .decode(type: [User].self, decoder: JSONDecoder())
            // 만약 에러가 발생하면 빈 배열로 반환
            .replaceError(with: [])
            // UI 갱신을 위해서 메인 스레드에서 진행
            .receive(on: DispatchQueue.main)
            // 최종 결과를 users에 주입 -> 이후 View 자동 갱신
            .assign(to: &$users)
    }
}

struct ContentView: View {
    @StateObject var viewModel: UserViewModel
    
    var body: some View {
        List(viewModel.users) { user in
            Text(user.name)
        }
        .onAppear {
            viewModel.fetchUsers()
        }
    }
}

#Preview {
    ContentView(viewModel: UserViewModel())
}
