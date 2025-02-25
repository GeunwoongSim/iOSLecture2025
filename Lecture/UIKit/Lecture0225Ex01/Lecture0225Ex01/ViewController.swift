//
//  ViewController.swift
//  Lecture0225Ex01
//
//  Created by 심근웅 on 2/25/25.
//

import UIKit

class ViewController: UIViewController {

 
  @IBOutlet weak var lblName: UILabel!
  @IBOutlet weak var btnSend: UIButton!
  @IBOutlet weak var txtName: UITextField!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    
    lblName.text = "안녕하세요"
  }
  @IBAction func changeGreeting(_ sender: UIButton) {
    if sender == btnSend {
      guard let name = txtName.text else {
        lblName.text = "Hello"
        return
      }
      lblName.text = "Hello, " + name
    }else {
      lblName.text = "Hello"
      txtName.text = ""
    }
    
  }

}

