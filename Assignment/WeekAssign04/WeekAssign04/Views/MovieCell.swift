//
//  MovieCell.swift
//  WeekAssign04
//
//  Created by 심근웅 on 3/3/25.
//

import UIKit

class MovieCell: UICollectionViewCell {
  // 포스터 이미지
  lazy var poster: UIImageView = {
    let image = UIImageView()
    image.translatesAutoresizingMaskIntoConstraints = false
    return image
  }()
  // 영화 제목
  lazy var title: UILabel = {
    let lbl = UILabel()
    lbl.font = UIFont.boldSystemFont(ofSize: 20)
    lbl.translatesAutoresizingMaskIntoConstraints = false
    return lbl
  }()
  // 즐겨찾기 표시
  lazy var isFavorite: UIImageView = {
    let image = UIImageView()
    image.translatesAutoresizingMaskIntoConstraints = false
    return image
  }()
  
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
    NSLayoutConstraint.activate([ // 즐겨찾기 표시
      isFavorite.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
      isFavorite.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
      isFavorite.heightAnchor.constraint(equalToConstant: 20),
      isFavorite.widthAnchor.constraint(equalToConstant: 20)
    ])
    NSLayoutConstraint.activate([ // 영화 제목
      title.leadingAnchor.constraint(equalTo: isFavorite.trailingAnchor),
      title.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8),
      title.bottomAnchor.constraint(equalTo: self.bottomAnchor),
      title.heightAnchor.constraint(equalToConstant: 40)
    ])
    NSLayoutConstraint.activate([ // 영화 포스터
      poster.leadingAnchor.constraint(equalTo: self.leadingAnchor),
      poster.trailingAnchor.constraint(equalTo: self.trailingAnchor),
      poster.topAnchor.constraint(equalTo: self.topAnchor),
      poster.bottomAnchor.constraint(equalTo: title.topAnchor)
    ])
  }
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
