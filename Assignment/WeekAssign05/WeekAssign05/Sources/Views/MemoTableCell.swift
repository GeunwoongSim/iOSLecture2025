//
//  MemoTableCell.swift
//  WeekAssign05
//
//  Created by 심근웅 on 3/8/25.
//

import Foundation
import UIKit
import Then
import SnapKit

class MemoTableCell: UITableViewCell {
  // Memo 정보
  var memo: MemoModel? {
    didSet {
      // 정보를 주입받으면 받은 정보를 베이스로 뷰 업데이트
      configue(memo: memo!)
    }
  }
  let image = UIImageView().then {
    $0.layer.cornerRadius = 8.5
    $0.layer.borderWidth = 1
  }
  let title = UILabel().then {
    $0.text = "타이틀"
    $0.textAlignment = .left
    $0.font = .preferredFont(forTextStyle: .headline)
  }
  let content = UILabel().then {
    $0.text = "내용ddddddsddfdfdsafsdfdsfsdafdsda"
    $0.textAlignment = .left
    $0.font = .preferredFont(forTextStyle: .body)
  }
  let date = UILabel().then {
//    $0.text = "09:22 AM"
    $0.text = ""
    $0.numberOfLines = 0
    $0.textAlignment = .left
    $0.font = .preferredFont(forTextStyle: .caption1)
  }
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    uiSetup()
  }
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
// MARK: - private Function
extension MemoTableCell {
  private func uiSetup() {
    self.backgroundColor = Constants.shared.backgroundColor
    [image, title, content, date].forEach { addSubview($0) }
    image.snp.makeConstraints {
      $0.leading.top.bottom.equalToSuperview().inset(8)
      $0.width.equalTo(self.snp.height)
    }
    title.snp.makeConstraints {
      $0.top.equalTo(image)
      $0.leading.equalTo(image.snp.trailing).offset(16)
      $0.trailing.equalToSuperview().inset(16)
      $0.height.equalTo(image.snp.height).dividedBy(3)
    }
    content.snp.makeConstraints {
      $0.bottom.equalTo(image)
      $0.leading.equalTo(image.snp.trailing).offset(16)
      $0.trailing.equalToSuperview().inset(16)
      $0.height.equalTo(image.snp.height).dividedBy(3)
    }
    date.snp.makeConstraints {
      $0.top.equalTo(title.snp.bottom)
      $0.leading.equalTo(image.snp.trailing).offset(16)
      $0.trailing.equalToSuperview().inset(16)
      $0.height.equalTo(image.snp.height).dividedBy(3)
    }
  }
  private func configue(memo: MemoModel) {
    title.text = memo.title
    content.text = memo.content
    date.text = memo.date.dateToDate
    image.image = UIImage(named: "")
  }
}
