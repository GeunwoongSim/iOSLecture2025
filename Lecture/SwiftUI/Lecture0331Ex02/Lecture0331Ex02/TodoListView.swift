//
//  TodoListView.swift
//  Lecture0331Ex02
//
//  Created by 심근웅 on 3/31/25.
//

import SwiftUI
import Combine

// MARK: - Model
struct Todo: Identifiable, Codable {
    var id: Int
    var title: String
    var completed: Bool
}

// MARK: - ViewModel
class TodoViewModel: ObservableObject {
    
    @Published var todos: [Todo] = []
    private var cancellables = Set<AnyCancellable>()
    private let baseURL = "https://jsonplaceholder.typicode.com/todos"
    
    // C
    func addTodo(_ title: String) {
        guard let url = URL(string: baseURL) else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue(
            "application/json",
            forHTTPHeaderField: "Content-Type"
        )
        
        let newTodo = Todo(
            id: Int.random(in: 1000...99999),
            title: title,
            completed: false
        )
        
        request.httpBody = try? JSONEncoder().encode(newTodo)
        
        URLSession.shared.dataTaskPublisher(for: request)
            .map(\.data)
            .decode(type: Todo.self, decoder: JSONDecoder())
            .replaceError(with: newTodo)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] todo in
                guard let self = self else { return }
                self.todos.append(todo)
            }
            .store(in: &cancellables)
    }
    
    // R
    func fetchTodos() {
        guard let url = URL(string: baseURL + "?_limit=10") else { return }
        
        URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: [Todo].self, decoder: JSONDecoder())
            .replaceError(with: [])
            .receive(on: DispatchQueue.main)
            .assign(to: &$todos)
    }
    
    // U
    func updateTodo(_ todo: Todo) {
        guard let url = URL(string: baseURL + "/\(todo.id)") else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        var updatedTodo = todo
        updatedTodo.completed.toggle()
        request.httpBody = try? JSONEncoder().encode(updatedTodo)
        
        URLSession.shared.dataTaskPublisher(for: request)
            .map(\.data)
            .decode(type: Todo.self, decoder: JSONDecoder())
            .replaceError(with: updatedTodo)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] todo in
                guard let self = self else { return }
                
                if let idx = self.todos.firstIndex(where: { $0.id == todo.id }) {
                    self.todos[idx] = todo
                }
            }
            .store(in: &cancellables)
    }
    
    // D
    func deleteTodo(_ offsets: IndexSet) {
        offsets.forEach { index in
            let todo = self.todos[index]
            guard let url = URL(string: baseURL + "/\(todo.id)") else { return }
            var request = URLRequest(url: url)
            request.httpMethod = "DELETE"
            
            URLSession.shared.dataTaskPublisher(for: request)
                .map { _ in } // 응답 무시
                .replaceError(with: ())
                .receive(on: DispatchQueue.main)
                .sink { [weak self] _ in
                    guard let self = self else { return }
                    self.todos.remove(atOffsets: offsets)
                }
                .store(in: &cancellables)
        }
    }
}

// MARK: - View
struct TodoListView: View {
    @StateObject var viewModel = TodoViewModel()
    @State private var newTitle = ""
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    TextField("할 일 추가", text: $newTitle)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    Button("추가") {
                        viewModel.addTodo(newTitle)
                        newTitle = ""
                    }
                }.padding()
                
                List {
                    ForEach(viewModel.todos) { todo in
                        HStack {
                            Image(systemName: todo.completed ? "checkmark.circle.fill" : "circle")
                                .onTapGesture {
                                    viewModel.updateTodo(todo)
                                }
                            Text(todo.title)
                        }
                    }
                    .onDelete(perform: viewModel.deleteTodo)
                }
            }
            .navigationTitle("📋 Todo List")
            .onAppear {
                viewModel.fetchTodos()
            }
        }
    }
}

#Preview {
    TodoListView()
}
