import UIKit
import Then
import SnapKit

class HomeViewController: UIViewController {
  // MARK: - Propertys
  var memos: [MemoModel] = [] // 메모 정보
  // 메모보여주는 방법 (.showTable, .showCollection)
  var memoContentMode: MomoContentMode = .showTable
  // MARK: - View
  lazy var tableView = UITableView().then {
    $0.delegate = self
    $0.dataSource = self
    $0.backgroundColor = Constants.shared.backgroundColor
    $0.showsVerticalScrollIndicator = false
    // 커스텀 셀 등록
    $0.register(MemoTableCell.self, forCellReuseIdentifier: Constants.shared.tableCellId)
  }
  lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()).then {
    $0.delegate = self
    $0.dataSource = self
    $0.backgroundColor = Constants.shared.backgroundColor
    $0.showsVerticalScrollIndicator = false
    // 커스텀 셀 등록
    $0.register(MemoCollectionCell.self, forCellWithReuseIdentifier: Constants.shared.collectionCellId)
  }
  // 네비게이션 오른쪽의 메뉴 버튼
  lazy var menuBtn = UIBarButtonItem(
    image: UIImage(systemName: "ellipsis"),
    menu: createMenu()
  )
  // MARK: - viewDidLoad
  override func viewDidLoad() {
    super.viewDidLoad()
    loadMemos() // 데이터를 받아옴
    uiSetup() // 각 UI들을 셋업해주는 함수를 실행
    NotificationCenter.default.addObserver(self, selector: #selector(fetchData), name: NSNotification.Name("DataUpdated"), object: nil)
  }
  deinit {
    NotificationCenter.default.removeObserver(self, name: NSNotification.Name("DataUpdated"), object: nil)
  }
}

// MARK: - Private Functions
extension HomeViewController {
  @objc func fetchData() {
    loadMemos()
    viewModeUpdate()
    toolBarSet()
  }
  // 디비에서 받아온 데이터를 memos프로퍼티에 대입
  private func loadMemos() {
    DataManager.shared.send(action: .memoLoad)
    memos = DataManager.shared.memos
  }
  // 전체 뷰를 구성
  private func uiSetup() {
    viewSet()
    naviBarSet()
    toolBarSet()
    viewModeUpdate()
  }
  // 가장 큰틀의 뷰 세팅
  private func viewSet() {
    view.backgroundColor = Constants.shared.backgroundColor
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
  }
  // 네비게이션바 세팅
  private func naviBarSet() {
    // 라지타이틀로 설정하고 스크롤시 인라인으로 들어감
    navigationController?.navigationBar.prefersLargeTitles = true
    self.navigationItem.largeTitleDisplayMode = .automatic
    self.title = "모든 메모"
    navigationItem.rightBarButtonItem = menuBtn
  }
  // 툴바 세팅
  private func toolBarSet() {
    navigationController?.isToolbarHidden = false
    let memoCountLbl = UIBarButtonItem(
      customView: UILabel().then {
        $0.text = "\(memos.count)개의 메모"
        $0.textAlignment = .center
    })
    // 빈 공간을 만들어 주는 아이템
    let flexibleSpace = UIBarButtonItem(
      barButtonSystemItem: .flexibleSpace,
      target: nil,
      action: nil
    )
    toolbarItems = [flexibleSpace, memoCountLbl, flexibleSpace]
  }
  // 네비게이션바의 메뉴 버튼의 메뉴를 생성
  // - 메뉴가 바뀌는 구간이 있기 때문에 따로 생성
  private func createMenu() -> UIMenu {
    // 목록/갤러리 (으)로 보기
    let showModeAction = UIAction(
      title: self.memoContentMode.info.title,
      image: self.memoContentMode.info.image
    ) { [unowned self] _ in
      self.memoContentMode.toggle()
      self.navigationItem.rightBarButtonItem?.menu = createMenu()
      self.viewModeUpdate() //
    }
    // 메모 추가하기
    let memoAddAction = UIAction(
      title: "메모 추가하기",
      image: UIImage(systemName: "square.and.pencil")
    ) { [unowned self] _ in self.showDetailMemo() }
    // 메뉴 생성 후 반환
    let menu = UIMenu(
      options: .displayInline,
      children: [
        showModeAction,
        UIMenu(options: .displayInline, children: [memoAddAction])
    ])
    return menu
  }
  // memoContentMode 설정하고 그에 따른 뷰 업데이트
  private func viewModeUpdate() {
    // Hidden 설정
    collectionView.isHidden = memoContentMode.showCollectionState
    tableView.isHidden = memoContentMode.showTableState
    // 데이터 적용
    self.collectionView.reloadData()
    self.tableView.reloadData()
  }
  // 작성/읽기 화면을 띄움
  private func showDetailMemo(memo: MemoModel? = nil) {
    let view = MemoDetailViewController()
    view.memo = memo
    view.detailMode = (memo == nil ? .add : .read)
    self.navigationController?.pushViewController(view, animated: true)
  }
}

// MARK: - UITableView Delegate / DataSource Settings
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
    self.showDetailMemo(memo: self.memos[indexPath.row])
  }
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 100
  }
}

// MARK: - UICollectionView Delegate / DataSource Settings
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
    self.showDetailMemo(memo: self.memos[indexPath.row])
  }
}

// MARK: - UICollectionView DelegateFlowLayout Settings
extension HomeViewController: UICollectionViewDelegateFlowLayout{
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    let length: CGFloat = (collectionView.frame.width-32) / 3
    return CGSize(width: length, height: length*1.2)
  }
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 16
  }
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    return 16
  }
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    UIEdgeInsets(top: 16, left: 0, bottom: 16, right: 0)
  }
}
