//
//  ImageDetailViewController.swift
//  Lecture0228Ex01
//
//  Created by 심근웅 on 2/28/25.
//

import UIKit

class ImageDetailViewController: UIViewController {
  var selectedImage: UIImage?
  @IBOutlet weak var imageView: UIImageView!
  override func viewDidLoad() {
    super.viewDidLoad()
    imageView.image = selectedImage
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

