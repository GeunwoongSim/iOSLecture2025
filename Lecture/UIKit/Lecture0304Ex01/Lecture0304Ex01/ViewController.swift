//
//  ViewController.swift
//  Lecture0304Ex01
//
//  Created by 심근웅 on 3/4/25.
//

import UIKit

class ViewController: UIViewController {
  let titleLbl: UILabel = {
    let view = UILabel()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.text = "Auto Layout 연습"
    view.textAlignment = .center
    view.font = UIFont.systemFont(ofSize: 30, weight: .bold)
    return view
  }()
  
  let redView: UIView = {
    let view = UIView()
    view.backgroundColor = .red
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    uiSetUp()
  }
  
  func uiSetUp(){
    view.backgroundColor = UIColor.systemYellow
    view.addSubview(titleLbl)
    view.addSubview(redView)

    NSLayoutConstraint.activate([
      titleLbl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
      titleLbl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
      titleLbl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
    ])
    
    NSLayoutConstraint.activate([
      redView.topAnchor.constraint(equalTo: titleLbl.bottomAnchor, constant: 20), // titleLabel 아래 20만큼 띄움
      redView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20), // 좌측 여백 20
      redView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20), // 우측 여백 20
      redView.heightAnchor.constraint(equalToConstant: 200) // 높이 200 고정
    ])
  }

}

