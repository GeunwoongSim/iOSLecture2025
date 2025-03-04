//
//  LifecycleViewController.swift
//  Lecture0304Ex02
//
//  Created by 심근웅 on 3/4/25.
//

import UIKit

class LifecycleViewController: UIViewController {
  
  let titleLabel: UILabel = {
    let label = UILabel()
    label.text = "Lifecycle View Controller"
    label.textAlignment = .center
    label.font = .systemFont(ofSize: 30, weight: .bold)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = .systemOrange
    
    setupLayer()
  }
  
  func setupLayer() {
    view.addSubview(titleLabel)
    
    NSLayoutConstraint.activate([
      titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
      titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
      titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
    ])
  }
  
}
