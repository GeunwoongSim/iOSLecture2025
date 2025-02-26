//
//  ViewController.swift
//  Lecture0226Ex02
//
//  Created by 심근웅 on 2/26/25.
//

import UIKit

class MainViewController: UIViewController {

  private var stackView: UIStackView = {
    let stack = UIStackView()
    stack.axis = .vertical
    stack.spacing = 40
    stack.translatesAutoresizingMaskIntoConstraints = false
    return stack
  }()
  
  private var fullScreenBtn: UIButton = {
    let button = UIButton(type: .system)
    button.setTitle("전체화면 모달", for: .normal)
    button.layer.cornerRadius = 8
    button.setTitleColor(.white, for: .normal)
    button.addTarget(self, action: #selector(btnTouch(sender: )), for: .touchUpInside)
    button.tag = 0
    button.backgroundColor = .blue
    return button
  }()
  
  private var popSheetBtn: UIButton = {
    let button = UIButton(type: .system)
    button.setTitle("카드형 시트", for: .normal)
    button.layer.cornerRadius = 8
    button.setTitleColor(.white, for: .normal)
    button.addTarget(self, action: #selector(btnTouch(sender: )), for: .touchUpInside)
    button.tag = 1
    button.backgroundColor = .green
    return button
  }()
  
  private var formSheetBtn: UIButton = {
    let button = UIButton(type: .system)
    button.setTitle("폼 시트", for: .normal)
    button.layer.cornerRadius = 8
    button.setTitleColor(.white, for: .normal)
    button.addTarget(self, action: #selector(btnTouch(sender: )), for: .touchUpInside)
    button.tag = 2
    button.backgroundColor = .orange
    return button
  }()
  
  private var popoverBtn: UIButton = {
    let button = UIButton(type: .system)
    button.setTitle("팝오버 (iPad)", for: .normal)
    button.layer.cornerRadius = 8
    button.setTitleColor(.white, for: .normal)
    button.addTarget(self, action: #selector(btnTouch(sender: )), for: .touchUpInside)
    button.tag = 3
    button.backgroundColor = .purple
    return button
  }()
  
  private var storyboardVCBtn: UIButton {
    let button = UIButton(type: .system)
    button.setTitle("스토리보드 뷰컨 띄우기", for: .normal)
    button.layer.cornerRadius = 8
    button.setTitleColor(.white, for: .normal)
    button.backgroundColor = .brown
    button.addTarget(self, action: #selector(btnTouch(sender: )), for: .touchUpInside)
    button.tag = 4
    return button
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    setUI()
    
  }

  func setUI() {
    view.backgroundColor = .systemBackground
    title = "모달 스타일 예제"
    
    view.addSubview(stackView)
    [fullScreenBtn, popSheetBtn, formSheetBtn, popoverBtn, storyboardVCBtn].forEach {
      stackView.addArrangedSubview($0)
      $0.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    NSLayoutConstraint.activate([
      stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
//      stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
//      stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40)
      stackView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -80)
    ])
  }
  
  @objc func btnTouch(sender: UIButton) {
    let modalVC: ModalContentViewController!
    switch sender.tag {
    case 0:
      modalVC = ModalContentViewController(modalTitle: "전체화면 모달", backgroundColor: .blue, style: .fullScreen)
      modalVC.modalTransitionStyle = .crossDissolve
    case 1:
      modalVC = ModalContentViewController(modalTitle: "카드형 시트", backgroundColor: .green, style: .pageSheet)
      modalVC.sheetPresentationController?.detents = [.medium(), .large()]
      modalVC.sheetPresentationController?.prefersGrabberVisible = true
    case 2:
      modalVC = ModalContentViewController(modalTitle: "폼 시트", backgroundColor: .systemOrange, style: .formSheet)
    case 3:
      modalVC = ModalContentViewController(modalTitle: "팝오버", backgroundColor: .purple, style: .popover)
      modalVC.popoverPresentationController?.sourceView = popoverBtn
      modalVC.popoverPresentationController?.sourceRect = popoverBtn.bounds
      modalVC.preferredContentSize = CGSize(width: 300, height: 200)
      modalVC.popoverPresentationController?.delegate = self
    default:
      let VC = storyboard?.instantiateViewController(withIdentifier: "viewControllerIDTest") as! ViewController
      navigationController?.pushViewController(VC, animated: true)
//      present(VC, animated: true)
      return
    }
    
    present(modalVC, animated: true)
  }
}

extension MainViewController: UIPopoverPresentationControllerDelegate {
  func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
    return .none
  }
}
