//
//  ModalViewController.swift
//  Lecture0304Ex03
//
//  Created by 심근웅 on 3/4/25.
//

import UIKit

class ModalViewController: UIViewController {
  lazy var lbl: UILabel = {
    let view = UILabel()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.font = .systemFont(ofSize: 22, weight: .bold)
    return view
  }()
  
  lazy var dismissBtn: UIButton = {
    let btn = UIButton()
    btn.setTitle("Dismiss Modal", for: .normal)
    btn.titleLabel?.font = .systemFont(ofSize: 20)
    btn.setTitleColor(.systemBlue, for: .normal)
    btn.addTarget(self, action: #selector(dismissBtnTouch), for: .touchUpInside)
    btn.translatesAutoresizingMaskIntoConstraints = false
    return btn
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .systemBackground
    view.addSubview(lbl)
    view.addSubview(dismissBtn)
    
    NSLayoutConstraint.activate([
      lbl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      lbl.centerYAnchor.constraint(equalTo: view.centerYAnchor)
    ])
    NSLayoutConstraint.activate([
      dismissBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      dismissBtn.topAnchor.constraint(equalTo: lbl.bottomAnchor, constant: 16)
    ])
  }
  @objc func dismissBtnTouch(sender: UIButton) {
    self.dismiss(animated: true)
  }
  
  /*
   // MARK: - Navigation
   
   // In a storyboard-based application, you will often want to do a little preparation before navigation
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
   // Get the new view controller using segue.destination.
   // Pass the selected object to the new view controller.
   }
   */
  
}
