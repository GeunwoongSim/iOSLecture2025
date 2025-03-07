import UIKit

class UserTableViewCell: UITableViewCell {
  var nameLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  var emailLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    uiSetup()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func configure(with user: User) {
    nameLabel.text = user.name
    emailLabel.text = user.email
  }
  
  func uiSetup() {
    self.addSubview(nameLabel)
    self.addSubview(emailLabel)
    
    NSLayoutConstraint.activate([
      nameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
      nameLabel.widthAnchor.constraint(equalToConstant: self.frame.width/2-8),
      nameLabel.topAnchor.constraint(equalTo: self.topAnchor),
      nameLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor)
    ])
    
    NSLayoutConstraint.activate([
      emailLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
      emailLabel.widthAnchor.constraint(equalToConstant: self.frame.width/2-8),
      emailLabel.topAnchor.constraint(equalTo: self.topAnchor),
      emailLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor)
    ])
  }
}
