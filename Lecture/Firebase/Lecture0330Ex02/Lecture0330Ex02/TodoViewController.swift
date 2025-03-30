import UIKit
import FirebaseFirestore

class TodoViewController: UIViewController {
    
    private var todos: [Todo] = []
    
    // 테이블 뷰 인스턴스 생성
    private let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        fetchTodos()
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        title = "할 일 목록"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(self.addTodo))
        
        // 테이블 뷰 설정
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
        
        // Auto Layout 설정
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

// UITableViewDataSource 프로토콜 구현
extension TodoViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell.textLabel?.text = todos[indexPath.row].title
        if todos[indexPath.row].isCompleted {
            cell.textLabel?.textColor = .systemBlue
        }
        return cell
    }
}

// UITableViewDelegate 프로토콜구현
extension TodoViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(self.todos[indexPath.row])
        FirestoreManager.shared.updateTodo(todo: self.todos[indexPath.row]) { error in
            if let error = error {
                print(error.localizedDescription)
            } else {
                self.fetchTodos()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let id = todos[indexPath.row].id
            FirestoreManager.shared.deleteTodo(id: id) { error in
                if let error = error {
                    print(error.localizedDescription)
                } else {
                    self.fetchTodos()
                }
            }
        }
    }
}

extension TodoViewController {
    // C 구현
    @objc private func addTodo() {
        let alert = UIAlertController(title: "할 일 추가", message: "새로운 할 일을 입력하세요.", preferredStyle: .alert)
        
        alert.addTextField { textField in
            textField.placeholder = "할 일 입력"
        }
        
        let addAction = UIAlertAction(title: "추가", style: .default) { _ in
            guard let textField = alert.textFields?.first, let text = textField.text, !text.isEmpty else {
                return
            }
            
            FirestoreManager.shared.addTodo(title: text) { error in
                if let error = error {
                    print("할 일 추가 오류: \(error.localizedDescription)")
                } else {
                    print("새 할 일 추가됨")
                    self.fetchTodos()
                }
            }
        }
        
        let cancelAction = UIAlertAction(title: "취소", style: .cancel)
        
        alert.addAction(addAction)
        alert.addAction(cancelAction)
        
        present(alert, animated: true, completion: nil)
    }
    
    // R 구현
    private func fetchTodos() {
        FirestoreManager.shared.fetchTodos { todos, error in
            guard let todos = todos, error == nil else {
                print(error?.localizedDescription ?? "알 수 없는 오류")
                return
            }
            
            self.todos = todos
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
}
