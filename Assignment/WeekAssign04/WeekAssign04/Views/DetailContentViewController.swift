//
//  DetailContentViewController.swift
//  WeekAssign04
//
//  Created by 심근웅 on 3/3/25.
//

import UIKit

class DetailContentViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  // 포스터 이미지
  private lazy var poster: UIImageView = {
    let view = UIImageView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.contentMode = .scaleAspectFit
    return view
  }()
  // 테이블 뷰
  private lazy var tableView: UITableView = {
    let view = UITableView(frame: view.bounds, style: .plain)
    view.delegate = self
    view.dataSource = self
    view.translatesAutoresizingMaskIntoConstraints = false
    // 커스텀 셀 등록
    view.register(DetailCell.self, forCellReuseIdentifier: "DetailCell")
    return view
  }()
  // 리뷰 추가 버튼
  private lazy var reviewAddBtn: UIBarButtonItem = {
    let btn = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(reviewAdd))
    return btn
  }()
  // 즐겨찾기 버튼
  private lazy var favoriteBtn: UIButton = {
    let view = UIButton()
    view.addTarget(self, action: #selector(favoriteBtnTouch(sender: )), for: .touchUpInside)
    view.translatesAutoresizingMaskIntoConstraints = false
    // 기본 이미지 설정
    view.setImage(UIImage(systemName: "star"), for: .normal)
    return view
  }()
  
  // vc에서 사용하는 변수
  private let viewModel: Repository = Repository.share
  var data: Movie! // 영화 정보
  var reviewDatas: [Review]! // 리뷰 정보
  
  // MARK: viewDidLoad
  override func viewDidLoad() {
    super.viewDidLoad()
    uiSetUp()
  }
  // UI Settings
  private func uiSetUp() {
    self.title = data.title
    view.backgroundColor = .systemBackground
    // Subview add
    view.addSubview(poster)
    view.addSubview(tableView)
    view.addSubview(favoriteBtn)
    navigationItem.rightBarButtonItem = reviewAddBtn
    // Auto Layout
    NSLayoutConstraint.activate([ // 포스터 이미지
      poster.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      poster.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      poster.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
      poster.heightAnchor.constraint(equalToConstant: 300)
    ])
    NSLayoutConstraint.activate([ // 테이블 뷰
      tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      tableView.topAnchor.constraint(equalTo: poster.bottomAnchor),
      tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
    ])
    NSLayoutConstraint.activate([ // 즐겨찾기 버튼
      favoriteBtn.widthAnchor.constraint(equalToConstant: 50),
      favoriteBtn.heightAnchor.constraint(equalToConstant: 50),
      favoriteBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
      favoriteBtn.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16)
    ])
    // 포스터 UI
    poster.image = UIImage(named: "movie\(data.id)")
    // 즐겨찾기 UI
    favoriteBtn.layer.cornerRadius = 25
    favoriteBtn.layer.borderWidth = 1
    favoriteBtn.layer.borderColor = UIColor.lightGray.cgColor
    if data.isFavorite { favoriteBtn.setImage(UIImage(systemName: "star.fill"), for: .normal) }
  }
  // 리뷰 추가 버튼 함수
  @objc func reviewAdd() {
    let alert = UIAlertController(title: "리뷰 추가", message: nil, preferredStyle: .alert)
    // 평점 작성을 위한 텍스트 필드
    alert.addTextField(configurationHandler: {
      $0.placeholder = "평점을 작성해 주세요(1~5)"
      $0.keyboardType = .numberPad
    })
    // 리뷰 작성을 위한 텍스트 필드
    alert.addTextField(configurationHandler: {
      $0.placeholder = "리뷰를 작성해 주세요"
    })
    // 저장 버튼
    let save = UIAlertAction(title: "저장", style: .default, handler: {_ in
      // 저장 버튼을 누르면 평점과 리뷰를 받아옴(둘중 하나라도 제대로 안되어있으면 저장 안됨)
      guard let ratingStr = alert.textFields?[0].text,
            let rating = Int(ratingStr),
            let review = alert.textFields?[1].text else {
        return
      }
      // 리뷰 내용이 없거나 평점이 1~5가 아니면 저장하지 않음
      if review == "" || rating < 1 || rating > 5 { return }
      // 리뷰 데이터 생성
      let data = Review(movieID: self.data.id, comment: review, rating: rating)
      self.viewModel.send(.addReview(review: data))
      self.reviewDatas.append(data)
      self.tableView.reloadData()
    })
    // 취소 버튼
    alert.addAction(UIAlertAction(title: "취소", style: .destructive))
    alert.addAction(save)
    present(alert, animated: true)
  }
  // 즐겨찾기 버튼 함수
  @objc func favoriteBtnTouch(sender: UIButton) {
    data.isFavorite.toggle()
    favoriteBtn.setImage(UIImage(systemName: data.isFavorite ? "star.fill" : "star"), for: .normal)
    viewModel.send(.favoriteChange(id: data.id, isFavorite: data.isFavorite))
  }
}

extension DetailContentViewController {
  // Row 개수
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    // 기본 Row(제목, 감독, 개봉일, 장르, 리뷰) + 리뷰 내용
    return 5 + reviewDatas.count
  }
  // 셀 생성
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
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
    default : // 리뷰 내용
      cell.title.text = "평점 \(reviewDatas[indexPath.row - 5].rating)"
      cell.content.text = reviewDatas[indexPath.row - 5].comment
    }
    return cell
  }
  // Row 높이
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 40
  }
}
