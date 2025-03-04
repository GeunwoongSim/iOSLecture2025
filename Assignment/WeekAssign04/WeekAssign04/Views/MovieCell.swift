//
//  MovieCell.swift
//  WeekAssign04
//작성중
//  Created by 심근웅 on 3/3/25.
//

import UIKit

class MovieCell: UICollectionViewCell {
  // 포스터 이미지
  lazy var poster = UIImageView()
  // 영화 제목
  lazy var title =  UILabel().then {
    $0.font = .boldSystemFont(ofSize: 20)
  }
  // 즐겨찾기 표시
  lazy var isFavorite = UIImageView()
  
  // MARK: Init
  override init(frame: CGRect) {
    super.init(frame: frame)
    uiSetUp()
  }
  private func uiSetUp() {
    // Subview add
    self.addSubview(title)
    self.addSubview(poster)
    self.addSubview(isFavorite)
    // Auto Layout
    isFavorite.snp.makeConstraints { // 즐겨찾기 표시
      $0.leading.equalTo(self.snp.leading).offset(8)
      $0.bottom.equalTo(self.snp.bottom).offset(-10)
      $0.width.height.equalTo(20)
    }
    title.snp.makeConstraints { // 영화 제목
      $0.leading.equalTo(isFavorite.snp.trailing)
      $0.trailing.equalTo(self.snp.trailing).offset(-8)
      $0.bottom.equalToSuperview()
      $0.height.equalTo(40)
    }
    poster.snp.makeConstraints { // 영화 포스터
      $0.leading.trailing.top.equalToSuperview()
      $0.bottom.equalTo(title.snp.top)
    }
  }
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
