//
//  DetailContentViewController.swift
//  WeekAssign04
//
//  Created by 심근웅 on 3/3/25.
//

import UIKit

class DetailContentViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
  private lazy var imageView: UIImageView = {
    let view = UIImageView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.contentMode = .scaleAspectFit
    return view
  }()
  private lazy var tableView: UITableView = {
    let view = UITableView(frame: view.bounds, style: .plain)
    view.delegate = self
    view.dataSource = self
    view.translatesAutoresizingMaskIntoConstraints = false
    view.register(DetailCell.self, forCellReuseIdentifier: "DetailCell")
//    view.isUserInteractionEnabled = false
    return view
  }()
  private lazy var reviewBtn: UIBarButtonItem = {
    let btn = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(reviewAdd))
    return btn
  }()
  var data: Movie!
  var reviewDatas: [Review] = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
    uiSetUp()
  }
  
  private func uiSetUp() {
    self.title = data.title
    imageView.image = UIImage(named: "movie\(data.id)")
    view.backgroundColor = .systemBackground
    view.addSubview(imageView)
    view.addSubview(tableView)
    navigationItem.rightBarButtonItem = reviewBtn
    
    NSLayoutConstraint.activate([
      imageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      imageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
      imageView.heightAnchor.constraint(equalToConstant: 300)
    ])
    
    // 테이블 뷰의 오토레이아웃
    NSLayoutConstraint.activate([
      tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      tableView.topAnchor.constraint(equalTo: imageView.bottomAnchor),
      tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
    ])
  }
  @objc func reviewAdd() {
    let alert = UIAlertController(title: "리뷰 추가", message: nil, preferredStyle: .alert)
    alert.addTextField(configurationHandler: {
      $0.placeholder = "평점을 작성해 주세요(1~5)"
      $0.keyboardType = .numberPad
    })
    alert.addTextField(configurationHandler: {
      $0.placeholder = "리뷰를 작성해 주세요"
    })
    let save = UIAlertAction(title: "저장", style: .default, handler: {_ in
      guard let ratingStr = alert.textFields?[0].text,
            let rating = Int(ratingStr),
            let review = alert.textFields?[1].text else {
        return
      }
      self.reviewDatas.append(Review(movieID: self.data.id, comment: review, rating: rating))
      Repository.share.reviews.append(Review(movieID: self.data.id, comment: review, rating: rating))
      Repository.share.reviewsSave()
      self.tableView.reloadData()
    })
    let cancel = UIAlertAction(title: "취소", style: .destructive)
    alert.addAction(cancel)
    alert.addAction(save)
    
    present(alert, animated: true)
  }
}

extension DetailContentViewController {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 5 + reviewDatas.count
  }
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    print(reviewDatas)
    let cell = tableView.dequeueReusableCell(withIdentifier: "DetailCell") as! DetailCell
    cell.isUserInteractionEnabled = false
    switch indexPath.row {
    case 0:
      cell.title.text = "제목"
      cell.content.text = data.title
    case 1:
      cell.title.text = "감독"
      cell.content.text = data.director
    case 2:
      cell.title.text = "개봉일"
      cell.content.text = data.releaseDate
    case 3:
      cell.title.text = "장르"
      cell.content.text = data.genre.joined(separator: ", ")
    case 4:
      cell.title.text = "리뷰"
      cell.content.text = ""
    default :
      cell.title.text = "평점 \(reviewDatas[indexPath.row-5].rating)"
      cell.content.text = reviewDatas[indexPath.row - 5].comment
    }
    return cell
  }
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 40
  }
}
