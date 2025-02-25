//
//  ViewController.swift
//  DayAssign05_0225
//
//  Created by 심근웅 on 2/25/25.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet weak var imageView: UIImageView!
  var imageNum: Int = 1
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }
  @IBAction func btnTouch(_ sender: UIButton) {
    if sender.tag == 1 {
      imageNum -= 1
      if imageNum == 0 { imageNum = 6 }
    } else {
      imageNum += 1
      if imageNum == 7 { imageNum = 1 }
    }
    imageView.image = UIImage(named: "\(imageNum).png")
    
  }
}

