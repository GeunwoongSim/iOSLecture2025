//
//  AddViewController.swift
//  Lecture0227Ex02
//
//  Created by 심근웅 on 2/27/25.
//

import UIKit

class AddViewController: UIViewController {

  @IBOutlet weak var TodoTextField: UITextField!
  override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
  @IBAction func addBtnTouch(_ sender: UIButton) {
    guard let addTodo = TodoTextField.text else {
      print("텍스트 필드 값 받아오기 실패")
      return
    }
    TodoTextField.text = ""
    VM.shared.addTask(addTodo, iconName: "clock.png")
    navigationController?.popViewController(animated: true)
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
