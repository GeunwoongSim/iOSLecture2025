//
//  CalculatorViewController.swift
//  Lecture0225Ex01
//
//  Created by 심근웅 on 2/25/25.
//

import UIKit

class CalculatorViewController: UIViewController {
  @IBOutlet weak var num1: UITextField!
  @IBOutlet weak var num2: UITextField!
  @IBOutlet weak var oper: UITextField!
  @IBOutlet weak var result: UILabel!
  
  override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

  @IBAction func calculate(_ sender: UIButton) {
    guard let num1 = Int(num1.text ?? "0"), let num2 = Int(num2.text ?? "0"), let oper = oper.text else {
      result.text = "잘못된 입력입니다."
      return
    }
    if oper == "+" {
      result.text = "결과: \(num1 + num2)"
    }else if oper == "-" {
      result.text = "결과: \(max(num1, num2) - min(num1, num2))"
    }else {
      result.text = "잘못된 입력입니다."
    }
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
