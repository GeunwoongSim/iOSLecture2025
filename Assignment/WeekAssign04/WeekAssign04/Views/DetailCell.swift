//
//  DetailCell.swift
//  WeekAssign04
//
//  Created by 심근웅 on 3/3/25.
//

import UIKit

class DetailCell: UITableViewCell {
  lazy var title: UILabel = {
    let view = UILabel()
    view.font = .boldSystemFont(ofSize: 22)
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  lazy var content: UILabel = {
    let view = UILabel()
    view.font = .systemFont(ofSize: 17)
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    uiSetUp()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }
  
  func uiSetUp() {
    self.addSubview(title)
    self.addSubview(content)
    
    NSLayoutConstraint.activate([
      title.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24),
      title.trailingAnchor.constraint(equalTo: self.centerXAnchor, constant: -12),
      title.topAnchor.constraint(equalTo: self.topAnchor),
      title.bottomAnchor.constraint(equalTo: self.bottomAnchor)
    ])
    NSLayoutConstraint.activate([
      content.leadingAnchor.constraint(equalTo: self.centerXAnchor, constant: 12),
      content.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -24),
      content.topAnchor.constraint(equalTo: self.topAnchor),
      content.bottomAnchor.constraint(equalTo: self.bottomAnchor)
    ])
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    // Configure the view for the selected state
  }
  
}

