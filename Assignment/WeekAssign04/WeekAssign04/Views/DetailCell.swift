//
//  DetailCell.swift
//  WeekAssign04
//
//  Created by 심근웅 on 3/3/25.
//

import UIKit

class DetailCell: UITableViewCell {
  // Row 이름
  lazy var title: UILabel = {
    let view = UILabel()
    view.font = .boldSystemFont(ofSize: 22)
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  // Row 내용
  lazy var content: UILabel = {
    let view = UILabel()
    view.font = .systemFont(ofSize: 17)
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  // MARK: Init
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    uiSetUp()
  }
  // UI Settings
  func uiSetUp() {
    // Subview add
    self.addSubview(title)
    self.addSubview(content)
    // Auto Layout
    NSLayoutConstraint.activate([ // Row 이름
      title.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24),
      title.trailingAnchor.constraint(equalTo: self.centerXAnchor, constant: -12),
      title.topAnchor.constraint(equalTo: self.topAnchor),
      title.bottomAnchor.constraint(equalTo: self.bottomAnchor)
    ])
    NSLayoutConstraint.activate([ // Row 내용
      content.leadingAnchor.constraint(equalTo: self.centerXAnchor, constant: 12),
      content.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -24),
      content.topAnchor.constraint(equalTo: self.topAnchor),
      content.bottomAnchor.constraint(equalTo: self.bottomAnchor)
    ])
  }
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

