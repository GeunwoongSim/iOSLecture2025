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
  private lazy var filterBtn: UIBarButtonItem = {
    let btn = UIBarButtonItem(image: UIImage(systemName: "star"), style: .plain, target: self, action: #selector(movieFilter))
    return btn
  }()
  
  var movies: [Movie] = []
  var isFavorite: Bool = false
  
  override func viewDidLoad() {
    super.viewDidLoad()
    movies = viewModel.dbs
    uiSetUp()
  }
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    movies = viewModel.dbs
    collectionView.reloadData()
  }
  
  private func uiSetUp() {
    self.title = "Movie"
    view.backgroundColor = .systemBackground
    view.addSubview(collectionView)
    navigationItem.rightBarButtonItem = filterBtn
    // 컬렉션뷰의 오토레이아웃
    NSLayoutConstraint.activate([
      collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      collectionView.topAnchor.constraint(equalTo: view.topAnchor),
      collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
    ])
  }
  
  @objc func movieFilter() {
    isFavorite.toggle()
    if isFavorite {
      self.movies = viewModel.dbs.filter { $0.isFavorite }
      self.filterBtn.image = UIImage(systemName: "star.fill")
    }else {
      self.movies = viewModel.dbs
      self.filterBtn.image = UIImage(systemName: "star")
    }
    collectionView.reloadData()
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return movies.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieCell", for: indexPath) as! MovieCell
    let data = movies[indexPath.row]
    cell.title.text = data.title
    cell.poster.image = UIImage(named: "movie\(data.id)")
    if data.isFavorite { cell.isFavorite.image = UIImage(systemName: "star.fill") }
    else { cell.isFavorite.image = UIImage(systemName: "star") }
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    let view = DetailContentViewController()
    view.data = movies[indexPath.row]
    view.reviewDatas = viewModel.reviews.filter{ $0.movieID == view.data.id }
    navigationController?.pushViewController(view, animated: true)
  }
}

