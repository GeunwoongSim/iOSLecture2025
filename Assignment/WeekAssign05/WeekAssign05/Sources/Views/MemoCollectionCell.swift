//
//  MomoCollectionViewController.swift
//  WeekAssign05
//
//  Created by 심근웅 on 3/8/25.
//

import Foundation
import UIKit
import Then
import SnapKit

class MemoCollectionCell: UICollectionViewCell {
  var memo: MemoModel? {
    didSet {
      configue(memo: memo!)
    }
  }
  let image = UIImageView().then {
    $0.layer.cornerRadius = 8.5
//    $0.layer.borderWidth = 1
    $0.backgroundColor = .white
  }
  let title = UILabel().then {
    $0.text = "타이틀"
    $0.numberOfLines = 2
    $0.textAlignment = .center
    $0.font = .preferredFont(forTextStyle: .headline)
  }
  let date = UILabel().then {
    $0.text = "2025. 12. 31."
    $0.numberOfLines = 1
    $0.textAlignment = .center
    $0.font = .preferredFont(forTextStyle: .caption1)
  }
  override init(frame: CGRect) {
    super.init(frame: frame)
    uiSetup()
  }
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

extension MemoCollectionCell {
  private func uiSetup() {
    [image, title, date].forEach { addSubview($0) }
    image.snp.makeConstraints {
      $0.top.leading.trailing.equalToSuperview()
      $0.height.equalTo(super.snp.width).multipliedBy(0.8)
    }
    title.snp.makeConstraints {
      $0.leading.trailing.equalToSuperview()
      $0.top.equalTo(image.snp.bottom)
      $0.height.equalTo(super.snp.width).multipliedBy(0.45)
    }
    date.snp.makeConstraints {
      $0.leading.trailing.bottom.equalToSuperview()
      $0.top.equalTo(title.snp.bottom)
      $0.height.equalTo(super.snp.width).multipliedBy(0.25)
    }
  }
  private func configue(memo: MemoModel) {
    title.text = memo.title
    date.text = memo.date.dateToDate
    image.image = UIImage(named: "")
  }
}
