//
//  ViewController.swift
//  WeekAssign04
//
//  Created by 심근웅 on 2/28/25.
//

import UIKit

class HomeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
  private lazy var viewModel: Repository = Repository.share
  private lazy var collectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.itemSize = CGSize(width: view.frame.width * 0.45, height: 250)
    layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)

    let view = UICollectionView(frame: view.bounds, collectionViewLayout: layout)
    view.delegate = self
    view.dataSource = self
    view.translatesAutoresizingMaskIntoConstraints = false
    view.register(MovieCell.self, forCellWithReuseIdentifier: "MovieCell")
    return view
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    uiSetUp()
  }
  
  private func uiSetUp() {
    self.title = "Movie"
    view.backgroundColor = .systemBackground
    view.addSubview(collectionView)
    // 컬렉션뷰의 오토레이아웃
    NSLayoutConstraint.activate([
      collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      collectionView.topAnchor.constraint(equalTo: view.topAnchor),
      collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
    ])
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return viewModel.dbs.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieCell", for: indexPath) as! MovieCell
    let data = viewModel.dbs[indexPath.row]
    cell.title.text = data.title
    cell.poster.image = UIImage(named: "movie\(data.id)")
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    let view = DetailContentViewController()
    view.data = viewModel.dbs[indexPath.row]
    view.reviewDatas = viewModel.reviews.filter{ $0.movieID == view.data.id }
    navigationController?.pushViewController(view, animated: true)
  }
}

