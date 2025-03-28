import Foundation
import UIKit
import Then
import SnapKit

class MemoDetailViewController: UIViewController {
  // MARK: - Propertys
  var memo: MemoModel?
  // 읽기모드, 수정모드, 추가모드
  var detailMode: MemoDetailMode = .read
  // MARK: - View
  lazy var titleView = UITextField().then {
    $0.placeholder = "제목 입력"
    $0.text = "메모"
    $0.font = .boldSystemFont(ofSize: 18)
    $0.textAlignment = .center
    $0.delegate = self
  }
  lazy var deleteBtn = UIBarButtonItem(image: UIImage(systemName: "trash"), style: .plain, target: self, action: #selector(memoDelete))
  lazy var scrlView = UIScrollView().then {
    $0.showsVerticalScrollIndicator = false
  }
  lazy var imgView = UIImageView().then {
    $0.layer.cornerRadius = Constants.shared.corner
    $0.contentMode = .scaleToFill
    $0.layer.borderWidth = 1
    $0.isHidden = true
  }
  lazy var textView = UITextView().then {
    $0.layer.cornerRadius = Constants.shared.corner
    $0.layer.borderWidth = 1
    $0.font = UIFont.systemFont(ofSize: 17, weight: .medium)
    $0.textContainerInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
  }
  // 사진 첨부 버튼
  lazy var photoButton = UIBarButtonItem(
    image: UIImage(systemName: "photo"),
    style: .plain,
    target: self,
    action: #selector(didTapPhotoButton)
  )
  lazy var editOrDoneButton = UIBarButtonItem(
    title: "수정",
    style: .plain,
    target: self,
    action: #selector(didTapEditOrDoneButton)
  )
  let memoDate = UIBarButtonItem(customView: UILabel().then {
    $0.text = ""
    $0.textAlignment = .center
  })
  let flexibleSpace = UIBarButtonItem(
    barButtonSystemItem: .flexibleSpace,
    target: nil,
    action: nil
  )
  // MARK: - viewDidLoad
  override func viewDidLoad() {
    super.viewDidLoad()
    uiSetup()
  }
  // MARK: - viewWillAppear
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
    NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
  }
  // MARK: - viewWillDisappear
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    NotificationCenter.default.post(name: NSNotification.Name("DataUpdated"), object: nil)
    NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
    NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
  }
}
// MARK: - Private Functions
extension MemoDetailViewController {
  private func uiSetup() {
    viewSet()
    naviBarSet()
    toolBarSetup()
    configue()
    viewModeSet()
  }
  // 가장 큰틀의 뷰 세팅
  private func viewSet() {
    view.backgroundColor = .systemBackground
    [scrlView].forEach { view.addSubview($0) }
    [imgView, textView].forEach { scrlView.addSubview($0) }
    // scrollView
    scrlView.snp.makeConstraints {
      $0.leading.trailing.equalToSuperview().inset(20)
      $0.top.bottom.equalTo(view.safeAreaLayoutGuide).inset(20)
    }
    // imageView
    imgView.snp.makeConstraints {
      $0.top.equalToSuperview()
      $0.centerX.equalToSuperview()
      $0.width.height.equalTo(UIScreen.screenWidth*0.6)
    }
    view.layoutIfNeeded()
    // tableView
    textView.snp.makeConstraints {
      let top = imgView.isHidden ? scrlView.snp.top : imgView.snp.bottom
      $0.top.equalTo(top).offset(20)
      $0.centerX.width.equalToSuperview()
      $0.width.equalToSuperview()
      $0.height.equalTo(420)
    }
    view.layoutIfNeeded()
  }
  // 네비게이션바 세팅
  private func naviBarSet() {
    navigationController?.navigationBar.prefersLargeTitles = false
    let naviBarAppear = UINavigationBarAppearance()
    naviBarAppear.configureWithOpaqueBackground()
    naviBarAppear.shadowColor = UIColor.lightGray
    navigationController?.navigationBar.standardAppearance = naviBarAppear
    navigationController?.navigationBar.scrollEdgeAppearance = naviBarAppear
    navigationItem.rightBarButtonItem = deleteBtn
    // 타이블 레이블
    titleView.frame = CGRect(x: 0, y: 0, width: 200, height: 30)
    navigationItem.titleView = titleView
  }
  // 툴바 세팅
  private func toolBarSetup() {
    let toolBarAppear = UIToolbarAppearance()
    toolBarAppear.configureWithOpaqueBackground()
    toolBarAppear.shadowColor = UIColor.lightGray
    navigationController?.toolbar.standardAppearance = toolBarAppear
    navigationController?.toolbar.scrollEdgeAppearance = toolBarAppear
    navigationController?.isToolbarHidden = false
    // toolBar Items 설정
    toolbarItems = [photoButton, flexibleSpace ,memoDate, flexibleSpace, editOrDoneButton]
  }
  // 수정모드 / 읽기모드 버튼 함수
  @objc private func didTapEditOrDoneButton() {
    switch detailMode {
    case .add: // 내용을 저장
      let title = titleView.text ?? "메모"
      let memoData = MemoModel(title: title, content: textView.text, date: Date(), image: imgView.image)
      self.memo = memoData
      DataManager.shared.send(action: .memoSave(data: memoData))
    case .edit: // 내용을 수정
      let title = titleView.text ?? "메모"
      let memoData = MemoModel(uuid: memo!.uuid, title: title, content: textView.text, date: Date(), image: imgView.image)
      DataManager.shared.send(action: .memoEdit(data: memoData))
    case .read: // 수정 모드로 전환
      print("수정 모드로 전환")
    }
    detailMode.toggle()
    viewModeSet()
  }
  private func viewModeSet() {
    textView.isEditable = detailMode.isEditable
    textView.isSelectable = detailMode.isEditable
    titleView.isEnabled = detailMode.isEditable
    photoButton.isEnabled = detailMode.isEditable
    deleteBtn.isHidden = false
    switch detailMode {
    case .add:
      editOrDoneButton.title = "완료"
      titleView.placeholder = "제목 입력"
      titleView.becomeFirstResponder() // 키보드 자동으로 띄우기
      deleteBtn.isHidden = true
    case .read:
      editOrDoneButton.title = "수정"
      titleView.placeholder = ""
      textView.resignFirstResponder() // 키보드 내리기
      (memoDate.customView as! UILabel).text = memo?.date .dateToTime
    case .edit:
      editOrDoneButton.title = "완료"
      titleView.placeholder = "제목 입력"
      textView.becomeFirstResponder() // 키보드 자동으로 띄우기
    }
    memoDate.customView?.sizeToFit()
    view.layoutIfNeeded()
  }
  // 메모 정보를 주입했으면 뿌려줌
  private func configue() {
    self.titleView.text = memo?.title
    self.textView.text = memo?.content
    (self.memoDate.customView as! UILabel).text = memo?.date.dateToDate
    self.imgView.image = memo?.image
    if (memo?.image) != nil {
      self.imgView.isHidden = false
    }
    updateViewConstraints()
  }
  @objc func memoDelete() {
    let alert = UIAlertController(title: "메모 삭제", message: "정말로 삭제하시겠습니까?", preferredStyle: .alert)
    let delete = UIAlertAction(title: "삭제", style: .destructive) {[unowned self] _ in
      if detailMode == .edit || detailMode == .read {
        DataManager.shared.send(action: .memoDelete(data: memo!))
      }
      self.navigationController?.popViewController(animated: true)
    }
    let cancel = UIAlertAction(title: "취소", style: .cancel)
    alert.addAction(delete)
    alert.addAction(cancel)
    self.present(alert, animated: true)
  }
}
// MARK: override 메서드
extension MemoDetailViewController {
  // view.layoutIfNeeded() 호출 시 해당 메서드 실행
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    scrlView.contentSize = CGSize(width: scrlView.frame.width, height:textView.frame.maxY)
  }
  // 사진이 없다가 추가되면 레이아웃을 다시 잡아줌
  override func updateViewConstraints() {
    super.updateViewConstraints()
    textView.snp.remakeConstraints {
      let top = imgView.isHidden ? scrlView.snp.top : imgView.snp.bottom
      $0.top.equalTo(top).offset(20)
      $0.centerX.width.equalToSuperview()
      $0.width.equalToSuperview()
      $0.height.equalTo(420)
    }
    // 다시 잡아준 레이아웃을 뿌려주고 스크롤뷰의 사이즈도 다시 잡아줌
    view.layoutIfNeeded()
    scrlView.contentSize = CGSize(width: scrlView.frame.width, height:textView.frame.maxY)
  }
  // 화면 터치시 키보드 내림
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    self.view.endEditing(true)
  }
}

// MARK: - 사진추가
extension MemoDetailViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
  @objc private func didTapPhotoButton() {
    let picker = UIImagePickerController()
    picker.sourceType = .photoLibrary
    picker.delegate = self
    present(picker, animated: true)
  }
  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
    if let selectedImage = info[.originalImage] as? UIImage {
      imgView.image = selectedImage
      imgView.isHidden = false
      updateViewConstraints()
    }
    picker.dismiss(animated: true)
  }
}
// MARK: - UITextFieldDelegate
extension MemoDetailViewController: UITextFieldDelegate {
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    textView.becomeFirstResponder()
    return true
  }
}

// MARK: - 키보드가 등장할때, 사라질때 실행 함수
extension MemoDetailViewController {
  @objc private func keyboardWillShow(_ notification: Notification) {
    guard let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else { return }
    let keyboardHeight = keyboardFrame.height
    let bottomInset = keyboardHeight - view.safeAreaInsets.bottom + (navigationController?.toolbar.frame.height ?? 0)
    
    // 스크롤뷰의 contentInset을 키보드 높이만큼 올림
    scrlView.contentInset.bottom = bottomInset
    // 툴바를 키보드 위로 이동 (애니메이션 적용)
    if let toolbar = navigationController?.toolbar {
      UIView.animate(withDuration: 0.3) {
        toolbar.transform = CGAffineTransform(translationX: 0, y: -bottomInset)
      }
    }
  }
  
  @objc private func keyboardWillHide(_ notification: Notification) {
    // 키보드가 사라질 때 원래 상태로 복구
    scrlView.contentInset.bottom = 0
    // 툴바도 원래 위치로 복귀
    if let toolbar = navigationController?.toolbar {
      UIView.animate(withDuration: 0.3) {
        toolbar.transform = .identity
      }
    }
  }
}
