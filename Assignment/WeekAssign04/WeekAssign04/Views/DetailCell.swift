//
//  DetailCell.swift
//  WeekAssign04
//
//  Created by 심근웅 on 3/3/25.
//

import UIKit

class DetailCell: UITableViewCell {
  // Row 이름
  lazy var title = UILabel().then {
    $0.font = .boldSystemFont(ofSize: 22)
  }
  // Row 내용
  lazy var content = UILabel().then {
    $0.font = .systemFont(ofSize: 17)
  }
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
    title.snp.makeConstraints { // Row 이름
      $0.leading.equalToSuperview().offset(24)
      $0.top.bottom.equalToSuperview()
      $0.trailing.equalTo(self.snp.centerX).offset(-12)
    }
    content.snp.makeConstraints { // Row 내용
      $0.leading.equalTo(self.snp.centerX).offset(12)
      $0.trailing.equalToSuperview().offset(-24)
      $0.top.bottom.equalToSuperview()
    }
  }
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

