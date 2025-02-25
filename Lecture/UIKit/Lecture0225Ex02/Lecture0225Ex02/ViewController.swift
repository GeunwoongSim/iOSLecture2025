//
//  ViewController.swift
//  Lecture0225Ex02
//
//  Created by 심근웅 on 2/25/25.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var lampImage: UIImageView!
  var isZoom: Bool = false
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }

  @IBAction func btnResizeImage(_ sender: UIButton) {
    var w: CGFloat = 0
    var h: CGFloat = 0
    let scale: CGFloat = 1.5
    
    if isZoom {
      sender.setTitle("확대", for: .normal)
      w = lampImage.frame.width / scale
      h = lampImage.frame.height / scale
//      sender.backgroundColor = .brown
      sender.setImage(UIImage(systemName: "plus.magnifyingglass"), for: .normal)
    }else {
      sender.setTitle("축소", for: .normal)
      w = lampImage.frame.width * scale
      h = lampImage.frame.height * scale
//      sender.backgroundColor = .systemMint
      sender.setImage(UIImage(systemName: "minus.magnifyingglass"), for: .normal)
    }
    lampImage.frame.size = CGSize(width: w, height: h)
    
    isZoom.toggle()
  }
  @IBAction func lampSwitch(_ sender: UISwitch) {
    lampImage.isHighlighted = sender.isOn
  }
  
}

