//
//  ViewController.swift
//  WeekAssign04
//
//  Created by 심근웅 on 2/28/25.
//

import UIKit
import SnapKit

final class HomeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
  // 영화 목록을 보여주는 컬렉션 뷰
  private lazy var collectionView: UICollectionView = {
    // 컬렉션 뷰 요소 크기
    let layout = UICollectionViewFlowLayout()
    layout.itemSize = CGSize(width: view.frame.width * 0.45, height: 250)
    layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    // 컬렉션 뷰 속성
    let view = UICollectionView(frame: view.bounds, collectionViewLayout: layout)
    view.delegate = self
    view.dataSource = self
    // 커스텀 셀 등록
    view.register(MovieCell.self, forCellWithReuseIdentifier: "MovieCell")
    return view
  }()
  // 즐겨찾기 필터 버튼
  private lazy var filterBtn: UIBarButtonItem = {
    let btn = UIBarButtonItem(image: UIImage(systemName: "star"), style: .plain, target: self, action: #selector(filterBtnTouch))
    return btn
  }()
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
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieCell", for: indexPath) as! MovieCell
    let data = contentMode ? viewModel.filterMovies[indexPath.row] : viewModel.movies[indexPath.row]
    cell.title.text = data.title
    cell.poster.image = UIImage(named: "movie\(data.id)")
    cell.isFavorite.image = UIImage(systemName: (data.isFavorite ? "star.fill" : "star"))
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
