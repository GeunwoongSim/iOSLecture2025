//
//  ViewController.swift
//  Lecture0227Ex03
//
//  Created by 심근웅 on 2/27/25.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
  
  @IBOutlet weak var collectionView: UICollectionView!
  let items = (0...11).map { "card\($0/2+1)" }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    collectionView.delegate = self
    collectionView.dataSource = self
    
    let nib = UINib(nibName: "CustomCollectionViewCell", bundle: nil)
//    collectionView.register(nib, forCellWithReuseIdentifier: "Cell")
  }
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return items.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CustomCollectionViewCell
//    cell.backgroundColor = .blue
    cell.imageView.image = UIImage(named: items[indexPath.row])
    return cell
  }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
  // 셀 크기
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let width = (collectionView.frame.width - 30) / 3  // 3열
    return CGSize(width: width, height: width*1.5)  // 정사각형 셀
  }
  
  // 셀 간격
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 10
  }
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    return 10
  }
}
