//
//  ViewController.swift
//  WeekAssign05
//
//  Created by 심근웅 on 3/8/25.
//

import UIKit
import Then
import SnapKit

class HomeViewController: UIViewController {
  var memos: [MemoModel] = [] // 메모 정보
  var memoContentMode: MomoContentMode = .showCollection // 메모보여주는 방법 ( showTable, showCollection )
  // 테이블 뷰
  lazy var tableView = UITableView().then {
    $0.delegate = self
    $0.dataSource = self
    $0.isHidden = true
    $0.backgroundColor = Constants.shared.backgroundColor
    $0.register(MemoTableCell.self, forCellReuseIdentifier: Constants.shared.tableCellId)
    $0.showsVerticalScrollIndicator = false
  }
  // 컬렉션 뷰
  lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()).then {
    $0.delegate = self
    $0.dataSource = self
//    $0.isHidden = true
    $0.backgroundColor = Constants.shared.backgroundColor
    $0.register(MemoCollectionCell.self, forCellWithReuseIdentifier: Constants.shared.collectionCellId)
    $0.showsVerticalScrollIndicator = false
  }
  // 툴바에 올라갈 메모 개수 레이블
  lazy var memoCountLbl = UILabel().then {
    $0.text = "\(memos.count)개의 메모"
    $0.textAlignment = .center
  }
  // 네비게이션 아이템
  var menuBtn: UIBarButtonItem!
  
  // MARK: - viewDidLoad
  override func viewDidLoad() {
    super.viewDidLoad()
    loadMemos()
    uiSetup()
    toolBarSetup()
  }
}
// MARK: - private Function
extension HomeViewController {
  // Memos Data Load
  private func loadMemos() {
    DataManager.shared.send(action: .memoLoad)
    memos = DataManager.shared.memos
  }
  // UI Setup
  private func uiSetup() {
    view.backgroundColor = Constants.shared.backgroundColor
    navigationController?.navigationBar.prefersLargeTitles = true
    self.navigationItem.largeTitleDisplayMode = .automatic
    self.title = "모든 메모"
    [tableView, collectionView].forEach { view.addSubview($0) }
    // tableView
    tableView.snp.makeConstraints {
      $0.leading.trailing.equalToSuperview().inset(16)
      $0.top.bottom.equalTo(view.safeAreaLayoutGuide)
    }
    // collectionView
    collectionView.snp.makeConstraints {
      $0.leading.trailing.equalToSuperview().inset(16)
      $0.top.bottom.equalTo(view.safeAreaLayoutGuide)
    }
    // navigation right bar item
    menuBtn = UIBarButtonItem(
      image: UIImage(systemName: "ellipsis"),
      menu: createMenu()
    )
    navigationItem.rightBarButtonItem = menuBtn
  }
  // Memo Menu Create
  private func createMenu() -> UIMenu {
    let menu = UIMenu(options: .displayInline, children: [
      UIAction(title: self.memoContentMode.info.title, image: self.memoContentMode.info.image) { [unowned self] _ in
        self.memoContentMode.toggle()
        self.navigationItem.rightBarButtonItem?.menu = createMenu()
        self.viewLoad()
      },
      UIMenu(options: .displayInline, children: [
        UIAction(title: "메모 추가하기", image: UIImage(systemName: "square.and.pencil")) { _ in
          print("메모 추가하기")
          let view = MemoDetailViewController()
          view.addModeSet()
          self.navigationController?.pushViewController(view, animated: true)
        }
      ])
    ])
    return menu
  }
  private func viewLoad() {
    switch memoContentMode {
    case .showCollection:
      self.tableView.isHidden = true
      self.collectionView.isHidden = false
      self.collectionView.reloadData()
    case .showTable:
      self.collectionView.isHidden = true
      self.tableView.isHidden = false
      self.tableView.reloadData()
    }
  }
  // MARK: - Toolbar Setting
  private func toolBarSetup() {
    navigationController?.isToolbarHidden = false
    memoCountLbl.text = "\(memos.count)개의 메모"
    let labelItem = UIBarButtonItem(customView: memoCountLbl)
    let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
    toolbarItems = [flexibleSpace, labelItem, flexibleSpace]
  }
}
// MARK: - UITableView Settings
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.memos.count
  }
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: Constants.shared.tableCellId, for: indexPath) as! MemoTableCell
    cell.memo = memos[indexPath.row]
    return cell
  }
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
    let view = MemoDetailViewController()
    view.memo = self.memos[indexPath.row]
    navigationController?.pushViewController(view, animated: true)
  }
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 100
  }
}

// MARK: - UICollectionView Settings
extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return self.memos.count
  }
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.shared.collectionCellId, for: indexPath) as! MemoCollectionCell
    cell.memo = memos[indexPath.row]
    return cell
  }
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    let view = MemoDetailViewController()
    view.memo = self.memos[indexPath.row]
    navigationController?.pushViewController(view, animated: true)
  }
}
// MARK: - UICollectionView DelegateFlowLayout
extension HomeViewController: UICollectionViewDelegateFlowLayout{
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let length: CGFloat = (collectionView.frame.width-32) / 3
    return CGSize(width: length, height: length*1.5)
  }
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
  }
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 16
  }
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    return 16
  }
}
// MARK: - data Manager
extension HomeViewController {
  private func testDataSet() {
    TestDataCenter.shared.memoDummy.forEach {
      DataManager.shared.send(action: .memoSave(data: $0))
    }
  }
}
