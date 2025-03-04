//
//  ViewController.swift
//  Lecture0304Ex03
//
//  Created by 심근웅 on 3/4/25.
//

import UIKit

class ViewController: UIViewController {

  lazy var modalBtn: UIButton = {
    let btn = UIButton ()
    btn.setTitle("Present ModalView", for: .normal)
    btn.titleLabel?.font = .systemFont(ofSize: 22, weight: .bold)
    btn.setTitleColor(.systemBlue, for: .normal)
    btn.addTarget(self, action: #selector(modalBtnTouch), for: .touchUpInside)
    btn.translatesAutoresizingMaskIntoConstraints = false
    return btn
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = UIColor.systemYellow
    view.addSubview(modalBtn)
    
    NSLayoutConstraint.activate([
      modalBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      modalBtn.centerYAnchor.constraint(equalTo: view.centerYAnchor)
    ])
  }

  @objc func modalBtnTouch(sender: UIButton) {
    let view = ModalViewController()
    view.modalPresentationStyle = .fullScreen
    view.lbl.text = "Modal View"
    self.present(view, animated: true)
  }
}

