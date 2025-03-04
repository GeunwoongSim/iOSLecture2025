//
//  DetailContentViewController.swift
//  WeekAssign04
//
//  Created by 심근웅 on 3/3/25.
//

import UIKit

class DetailContentViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  // 포스터 이미지
  private lazy var poster = UIImageView().then {
    $0.contentMode = .scaleAspectFit
    $0.image = UIImage(named: "movie\(data.id)")
  }
  // 테이블 뷰
  private lazy var tableView = UITableView().then {
    $0.delegate = self
    $0.dataSource = self
    // 커스텀 셀 등록
    $0.register(DetailCell.self, forCellReuseIdentifier: "DetailCell")
  }
  // 리뷰 추가 버튼
  private lazy var reviewAddBtn = UIBarButtonItem(
    barButtonSystemItem: .add,
    target: self,
    action: #selector(reviewAdd)
  )
  // 즐겨찾기 버튼
  private lazy var favoriteBtn = UIButton().then {
    $0.addTarget(self, action: #selector(favoriteBtnTouch(sender: )), for: .touchUpInside)
    $0.setImage(UIImage(systemName: data.isFavorite ? "star.fill" : "star"), for: .normal)
    $0.layer.cornerRadius = 25
    $0.layer.borderWidth = 1
    $0.layer.borderColor = UIColor.lightGray.cgColor
  }
  
  // vc에서 사용하는 변수
  private let dataManager: Repository = Repository.share
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
    poster.snp.makeConstraints { // 포스터 이미지
      $0.leading.trailing.equalToSuperview()
      $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
      $0.height.equalTo(300)
    }
    tableView.snp.makeConstraints { // 테이블 뷰
      $0.leading.trailing.equalToSuperview()
      $0.top.equalTo(poster.snp.bottom)
      $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
    }
    favoriteBtn.snp.makeConstraints { // 즐겨찾기 버튼
      $0.width.height.equalTo(50)
      $0.trailing.equalToSuperview().offset(-16)
      $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-16)
    }
  }
  // 리뷰 추가 버튼 함수
  @objc func reviewAdd() {
    let alert = UIAlertController(title: "리뷰 추가", message: nil, preferredStyle: .alert).then {
      $0.addTextField() { // 평점 작성을 위한 텍스트 필드
        $0.placeholder = "평점을 작성해 주세요(1~5)"
        $0.keyboardType = .numberPad
      }
      $0.addTextField() { // 리뷰 작성을 위한 텍스트 필드
        $0.placeholder = "리뷰를 작성해 주세요"
      }
    }
    // 저장 버튼
    let save = UIAlertAction(title:"저장", style: .default) { _ in
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
      self.dataManager.send(.addReview(review: data))
      self.reviewDatas.append(data)
      self.tableView.reloadData()
    }
    // 취소 버튼
    alert.addAction(UIAlertAction(title: "취소", style: .destructive))
    alert.addAction(save)
    present(alert, animated: true)
  }
  // 즐겨찾기 버튼 함수
  @objc func favoriteBtnTouch(sender: UIButton) {
    data.isFavorite.toggle()
    favoriteBtn.setImage(UIImage(systemName: data.isFavorite ? "star.fill" : "star"), for: .normal)
    dataManager.send(.favoriteChange(id: data.id, isFavorite: data.isFavorite))
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
