//
//  ViewController.swift
//  WeekAssign04
//
//  Created by 심근웅 on 2/28/25.
//

import UIKit
import SnapKit
import Then

final class HomeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
  
  private lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()).then {
    $0.delegate = self
    $0.dataSource = self
    $0.register(MovieCell.self, forCellWithReuseIdentifier: "MovieCell")
  }
  // 즐겨찾기 필터 버튼
  private lazy var filterBtn = UIBarButtonItem(
    image: UIImage(systemName: "star"),
    style: .plain,
    target: self,
    action: #selector(filterBtnTouch)
  )
  // vc에서 사용하는 변수
  private var contentMode: Bool = false
  private var viewModel: Repository = Repository.share
  
  // MARK: viewDidLoad
  override func viewDidLoad() {
    super.viewDidLoad()
    uiSetUp()
  }
  // MARK: viewWillAppear
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    collectionView.reloadData()
  }

  // 영화 목록 필터 버튼 함수
  @objc private func filterBtnTouch() {
    contentMode.toggle()
    filterBtn.image = UIImage(systemName: (contentMode ? "star.fill" : "star"))
    collectionView.reloadData()
  }
  // UI Settings
  private func uiSetUp() {
    self.title = "Movie"
    view.backgroundColor = .systemBackground
    // SubViews add
    view.addSubview(collectionView)
    navigationItem.rightBarButtonItem = filterBtn
    // Auto Layout
    collectionView.snp.makeConstraints { // 컬렉션 뷰
      $0.leading.trailing.top.equalToSuperview()
      $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
    }
  }
}

// MARK: CollectionView Settings
extension HomeViewController {
  // 셀의 개수
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return contentMode ? viewModel.filterMovies.count : viewModel.movies.count
  }
  // 셀 생성
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let data = contentMode ? viewModel.filterMovies[indexPath.row] : viewModel.movies[indexPath.row]
    let cell = (collectionView.dequeueReusableCell(withReuseIdentifier: "MovieCell", for: indexPath) as! MovieCell).then {
      $0.title.text = data.title
      $0.poster.image = UIImage(named: "movie\(data.id)")
      $0.isFavorite.image = UIImage(systemName: (data.isFavorite ? "star.fill" : "star"))
    }
    return cell
  }
  // 셀 선택 액션
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    let view = DetailContentViewController()
    view.data = contentMode ? viewModel.filterMovies[indexPath.row] : viewModel.movies[indexPath.row]
    view.reviewDatas = viewModel.reviews.filter{ $0.movieID == view.data.id }
    navigationController?.pushViewController(view, animated: true)
  }
}

// 컬렉션 뷰의 플로우 레이아웃
extension HomeViewController: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: view.frame.width * 0.45, height: 250)
  }
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
  }
}
