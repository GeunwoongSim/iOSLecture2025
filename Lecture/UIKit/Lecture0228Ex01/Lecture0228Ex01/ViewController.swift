//
//  ViewController.swift
//  Lecture0228Ex01
//
//  Created by 심근웅 on 2/28/25.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

  @IBOutlet weak var collectionView: UICollectionView!
//  let items = Array(1...6).map { "card\($0)" }
  var images = Array(1...20).map { UIImage(named: "card\($0 % 6 + 1)") }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    collectionView.delegate = self
    collectionView.dataSource = self
    
    let cellNib = UINib(nibName: "CustomCollectionViewCell", bundle: nil)
    collectionView.register(cellNib, forCellWithReuseIdentifier: "cell")
    
    let headerNib = UINib(nibName: "CustomHeaderView", bundle: nil)
    collectionView.register(headerNib, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "HeaderView")
    
    let longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress))
    collectionView.addGestureRecognizer(longPressGesture)
    
//    setupCollectionViewLayout()
  }
  func setupCollectionViewLayout() {
    if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
      layout.scrollDirection = .horizontal
    }
  }
  
  func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
    if kind == UICollectionView.elementKindSectionHeader {
      let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "HeaderView", for: indexPath) as! CustomHeaderView
      return header
    }
    return UICollectionReusableView()
  }
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
    return CGSize(width: collectionView.frame.width, height: 50)
  }
  @objc func handleLongPress(gesture: UILongPressGestureRecognizer) {
    let location = gesture.location(in: collectionView)
    if let indexPath = collectionView.indexPathForItem(at: location) {
      if gesture.state == .began {
        let alert = UIAlertController(title: "삭제", message: "이 이미지를 삭제하시겠습니까?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "취소", style: .cancel))
        alert.addAction(UIAlertAction(title: "삭제", style: .destructive, handler: { _ in
          self.images.remove(at: indexPath.row)
          self.collectionView.deleteItems(at: [indexPath])
        }))
        present(alert, animated: true)
      }
    }
  }

  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    
    if let detailVC = storyboard.instantiateViewController(withIdentifier: "ImageDetailViewController") as? ImageDetailViewController {
      detailVC.selectedImage = images[indexPath.row]
      navigationController?.pushViewController(detailVC, animated: true)
    }
  }
  // 셀 개수 반환
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return images.count
  }
  
  // 셀 설정
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomCollectionViewCell
    cell.imageView?.image = images[indexPath.row]
    return cell
  }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
  // MARK: - 셀 크기 설정
  // UICollectionView의 각 셀 크기를 반환하는 메서드
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let width = (collectionView.frame.width - 30) / 3  // 전체 너비에서 여백을 제외하고 3개의 열로 나눔
    return CGSize(width: width, height: width * 1.5)  // 정사각형 형태의 셀 크기 반환
  }
  
  // MARK: - 셀 간 간격 설정
  // 행(줄) 간 간격을 설정하는 메서드
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 10  // 각 행 간의 간격을 10pt로 설정
  }
  
  // 같은 행 내에서 항목들 간의 간격을 설정하는 메서드
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    return 10  // 같은 행 내의 셀들 사이 간격을 10pt로 설정
  }
}
