//
//  DetailViewController.swift
//  Lecture0227Ex02
//
//  Created by 심근웅 on 2/27/25.
//

import UIKit

class DetailViewController: UIViewController {
  
  @IBOutlet weak var viewLbl: UILabel!
  var viewLblText: String?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    viewLbl.text = viewLblText
    // Do any additional setup after loading the view.
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

