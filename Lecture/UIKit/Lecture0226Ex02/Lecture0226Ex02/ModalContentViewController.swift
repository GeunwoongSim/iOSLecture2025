//
//  ModalContentViewController.swift
//  Lecture0226Ex02
//
//  Created by 심근웅 on 2/26/25.
//

import UIKit

class ModalContentViewController: UIViewController {
  
  private let modalTitle: String
  private let backgroundColor: UIColor
  
  private lazy var titleLabel: UILabel = {
    let label = UILabel()
    label.text = modalTitle
    label.textAlignment = .center
    label.font = .boldSystemFont(ofSize: 20)
    label.textColor = .white
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  private lazy var closeButton: UIButton = {
    let button = UIButton(type: .system)
    button.setTitle("닫기", for: .normal)
    button.setTitleColor(.white, for: .normal)
    button.addTarget(self, action: #selector(dismissModal), for: .touchUpInside)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  init(modalTitle: String, backgroundColor: UIColor, style: UIModalPresentationStyle) {
    self.modalTitle = modalTitle
    self.backgroundColor = backgroundColor
    
    super.init(nibName: nil, bundle: nil)
    modalPresentationStyle = style
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
    // Do any additional setup after loading the view.
  }
  
  private func setupUI() {
    view.backgroundColor = backgroundColor
    
    view.addSubview(titleLabel)
    view.addSubview(closeButton)
    
    NSLayoutConstraint.activate([
      titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      titleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
      
      closeButton.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
      closeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
    ])
  }
  
  @objc func dismissModal() {
    dismiss(animated: true)
  }
}

