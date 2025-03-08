//
//  MemoAddViewController.swift
//  WeekAssign05
//
//  Created by 심근웅 on 3/8/25.
//

import Foundation
import UIKit

class MemoDetailViewController: UIViewController {
  var memo: MemoModel?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    uiSetup()
  }
  
}
extension MemoDetailViewController {
  private func uiSetup() {
    self.navigationController?.navigationBar.prefersLargeTitles = false
    view.backgroundColor = .systemBackground
    self.title = memo?.title
  }
}
