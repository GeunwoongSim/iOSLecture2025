//
//  DetailViewController.swift
//  Lecture0227Ex01
//
//  Created by 심근웅 on 2/27/25.
//

import UIKit

class DetailViewController: UIViewController {
  
  var titleStr: String?
  
  @IBOutlet weak var titleView: UINavigationItem!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    titleView.title = titleStr
    navigationItem.rightBarButtonItem = UIBarButtonItem(title: "삭제", style: .plain, target: self, action: #selector(deleteTask))
    
  }
  @objc func deleteTask() {
    print("삭제 버튼 클릭")
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

