//
//  ViewController.swift
//  Lecture0307Ex01
//
//  Created by 심근웅 on 3/7/25.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate {
  
  lazy var tableView: UITableView = {
    let view = UITableView()
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  // 유저 정보
  var users: [User] = []
  // MARK: viewDidLoad
  override func viewDidLoad() {
    super.viewDidLoad()
    fetchUsers()
    uiSetup()
  }
}

// MARK: private func
extension ViewController {
  private func uiSetup() {
    view.backgroundColor = .systemBackground
    tableView.delegate = self
    tableView.dataSource = self
    view.addSubview(tableView)
    
    NSLayoutConstraint.activate([
      tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
      tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
      tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
      tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 16)
    ])
    tableView.register(UserTableViewCell.self, forCellReuseIdentifier: "UserCell")
  }
  
  private func fetchUsers() {
    guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else {
      print("url 생성 실패")
      return
    }
    let task = URLSession.shared.dataTask(with: url) { data, response, error in
      if let error = error {
        print("네트워크 요청 실패: \(error.localizedDescription)")
        return
      }
      guard let data = data else {
        print("No Data")
        return
      }
      do {
        let decodedUsers = try JSONDecoder().decode([User].self, from: data)
        DispatchQueue.main.async {
          self.users = decodedUsers
          self.tableView.reloadData()
        }
      }catch {
        print("Error - Decode Error: \(error)")
      }
    }
    task.resume()
  }
}

// MARK: tableView DataSource
extension ViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    users.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell", for: indexPath) as! UserTableViewCell
    cell.configure(with: users[indexPath.row])
    return cell
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 40
  }
}

