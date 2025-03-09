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
  lazy var imgView = UIImageView().then {
    $0.layer.cornerRadius = Constants.shared.corner
    $0.backgroundColor = .white
  }
  lazy var titleLbl = UILabel().then {
    $0.numberOfLines = 2
    $0.textAlignment = .center
    $0.font = .preferredFont(forTextStyle: .headline)
  }
  lazy var dateLbl = UILabel().then {
    $0.numberOfLines = 1
    $0.textAlignment = .center
    $0.font = .preferredFont(forTextStyle: .caption1)
  }
  // MARK: - init
  override init(frame: CGRect) {
    super.init(frame: frame)
    uiSetup()
  }
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

// MARK: - Private Functions
extension MemoCollectionCell {
  // 뷰 구성
  private func uiSetup() {
    [imgView, titleLbl, dateLbl].forEach { addSubview($0) }
    imgView.snp.makeConstraints {
      $0.top.leading.trailing.equalToSuperview()
      $0.height.equalToSuperview().multipliedBy(0.6)
    }
    titleLbl.snp.makeConstraints {
      $0.leading.trailing.equalToSuperview()
      $0.top.equalTo(imgView.snp.bottom)
      $0.height.equalToSuperview().multipliedBy(0.3)
    }
    dateLbl.snp.makeConstraints {
      $0.leading.trailing.bottom.equalToSuperview()
      $0.top.equalTo(titleLbl.snp.bottom)
      $0.height.equalToSuperview().multipliedBy(0.1)
    }
  }
  // 값을 주입 받으면 뿌려줌
  private func configue(memo: MemoModel) {
    imgView.image = memo.image
    titleLbl.text = memo.title
    dateLbl.text = memo.date.dateToDate
  }
}
