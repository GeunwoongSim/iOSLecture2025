import Foundation
import UIKit
import Then
import SnapKit

class MemoTableCell: UITableViewCell {
  var memo: MemoModel? {
    didSet {
      configue(memo: memo!)
    }
  }
  lazy var imgView = UIImageView().then {
    $0.layer.cornerRadius = Constants.shared.corner
    $0.backgroundColor = .white
  }
  lazy var titleLbl = UILabel().then {
    $0.textAlignment = .left
    $0.font = .preferredFont(forTextStyle: .headline)
  }
  lazy var contentLbl = UILabel().then {
    $0.textAlignment = .left
    $0.font = .preferredFont(forTextStyle: .body)
  }
  lazy var dateLbl = UILabel().then {
    $0.textAlignment = .left
    $0.font = .preferredFont(forTextStyle: .caption1)
  }
  // MARK: - init
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    uiSetup()
  }
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

// MARK: - Private Functions
extension MemoTableCell {
  // 뷰 구성
  private func uiSetup() {
    self.backgroundColor = Constants.shared.backgroundColor
    [imgView, titleLbl, contentLbl, dateLbl].forEach { addSubview($0) }
    imgView.snp.makeConstraints {
      $0.leading.top.bottom.equalToSuperview().inset(8)
      $0.width.equalTo(self.snp.height)
    }
    titleLbl.snp.makeConstraints {
      $0.top.equalTo(imgView)
      $0.leading.equalTo(imgView.snp.trailing).offset(16)
      $0.trailing.equalToSuperview().inset(16)
      $0.height.equalTo(imgView.snp.height).dividedBy(3)
    }
    contentLbl.snp.makeConstraints {
      $0.bottom.equalTo(imgView)
      $0.leading.equalTo(imgView.snp.trailing).offset(16)
      $0.trailing.equalToSuperview().inset(16)
      $0.height.equalTo(imgView.snp.height).dividedBy(3)
    }
    dateLbl.snp.makeConstraints {
      $0.top.equalTo(titleLbl.snp.bottom)
      $0.leading.equalTo(imgView.snp.trailing).offset(16)
      $0.trailing.equalToSuperview().inset(16)
      $0.height.equalTo(imgView.snp.height).dividedBy(3)
    }
  }
  // 값을 주입받으면 뿌려줌
  private func configue(memo: MemoModel) {
    titleLbl.text = memo.title
    contentLbl.text = memo.content
    dateLbl.text = memo.date.dateToDate
    imgView.image = memo.image
  }
}
