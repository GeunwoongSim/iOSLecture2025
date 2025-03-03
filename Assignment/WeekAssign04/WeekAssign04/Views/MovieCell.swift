//
//  MovieCell.swift
//  WeekAssign04
//
//  Created by 심근웅 on 3/3/25.
//

import UIKit

class MovieCell: UICollectionViewCell {
  lazy var poster: UIImageView = {
    let image = UIImageView()
    image.translatesAutoresizingMaskIntoConstraints = false
    return image
  }()
  lazy var title: UILabel = {
    let lbl = UILabel()
    lbl.font = UIFont.boldSystemFont(ofSize: 20)
    lbl.translatesAutoresizingMaskIntoConstraints = false
    return lbl
  }()
  lazy var isFavorite: UIImageView = {
    let image = UIImageView()
    image.translatesAutoresizingMaskIntoConstraints = false
    return image
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    uiSetUp()
  }
  
  private func uiSetUp() {
    self.addSubview(title)
    self.addSubview(poster)
    self.addSubview(isFavorite)
    // 즐겨찾기 표시
    NSLayoutConstraint.activate([
      isFavorite.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
      isFavorite.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
      isFavorite.heightAnchor.constraint(equalToConstant: 20),
      isFavorite.widthAnchor.constraint(equalToConstant: 20)
    ])
    // 영화 제목
    NSLayoutConstraint.activate([
      title.leadingAnchor.constraint(equalTo: isFavorite.trailingAnchor),
      title.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8),
      title.bottomAnchor.constraint(equalTo: self.bottomAnchor),
      title.heightAnchor.constraint(equalToConstant: 40)
    ])
    // 영화 포스터
    NSLayoutConstraint.activate([
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

