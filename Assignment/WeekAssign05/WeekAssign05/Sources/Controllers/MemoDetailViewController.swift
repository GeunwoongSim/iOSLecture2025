//
//  MemoAddViewController.swift
//  WeekAssign05
//
//  Created by 심근웅 on 3/8/25.
//

import Foundation
import UIKit
import Then
import SnapKit

class MemoDetailViewController: UIViewController {
  var memo: MemoModel?
  // 화면에 보여지는 뷰
  lazy var scrollView = UIScrollView().then {
    $0.showsVerticalScrollIndicator = false
  }
  lazy var imageView = UIImageView().then {
    $0.layer.cornerRadius = 8
    $0.layer.borderWidth = 1
    $0.contentMode = .scaleAspectFill
    $0.isHidden = true
  }
  lazy var textView = UITextView().then {
    $0.layer.cornerRadius = 8
    $0.layer.borderWidth = 1
    $0.font = UIFont.systemFont(ofSize: 17, weight: .medium)
    $0.isEditable = false
    $0.isSelectable = false
    // 내부 인셋을 주는게 좀 더 괜찮아 보임
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
  // 빈공간 채우는 버튼
  let flexibleSpace = UIBarButtonItem(
    barButtonSystemItem: .flexibleSpace,
    target: nil,
    action: nil
  )
  // 메모 확인모드, 수정모드
  var isEditingMode = false
  // MARK: - viewDidLoad
  override func viewDidLoad() {
    super.viewDidLoad()
    configue()
    uiSetup()
    toolBarSetup()
  }
  func addModeSet() {
    didTapEditOrDoneButton()
  }
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    // scrollView 내부 크기 조절
    scrollView.contentSize = CGSize(width: scrollView.frame.width, height:textView.frame.maxY)
  }
  override func updateViewConstraints() {
    super.updateViewConstraints()
    textView.snp.remakeConstraints {
      let top = imageView.isHidden ? scrollView.snp.top : imageView.snp.bottom
      $0.top.equalTo(top).offset(20)
      $0.centerX.width.equalToSuperview()
      $0.width.equalToSuperview()
      $0.height.equalTo(420)
    }
    view.layoutIfNeeded()
    scrollView.contentSize = CGSize(width: scrollView.frame.width, height:textView.frame.maxY)
  }
  // 화면 터치시 키보드 내림
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    self.view.endEditing(true)
  }
}
// MARK: - private Function
extension MemoDetailViewController {
  // 셀 선택으로 불러올경우 memo 데이터를 이미 주입했기때문에 넣어주기만 함
  private func configue() {
    self.title = memo?.title
    self.imageView.image = memo?.image
    self.textView.text = memo?.content
    (self.memoDate.customView as! UILabel).text = memo?.date.dateToDate
  }
  private func uiSetup() {
    // 네비게이션 바 설정
    navigationController?.navigationBar.prefersLargeTitles = false
    let naviBarAppear = UINavigationBarAppearance()
    naviBarAppear.configureWithOpaqueBackground()
    naviBarAppear.shadowColor = UIColor.lightGray
    navigationController?.navigationBar.standardAppearance = naviBarAppear
    navigationController?.navigationBar.scrollEdgeAppearance = naviBarAppear
    // view 설정
    view.backgroundColor = .systemBackground
    // add subview
    [scrollView].forEach { view.addSubview($0) }
    [imageView, textView].forEach { scrollView.addSubview($0) }
    setAutoLayout()
  }
  private func setAutoLayout() {
    // 스크롤뷰 설정
    scrollView.snp.makeConstraints {
      $0.leading.trailing.equalToSuperview().inset(20)
      $0.top.bottom.equalTo(view.safeAreaLayoutGuide).inset(20)
    }
    imageView.snp.makeConstraints {
      $0.top.equalToSuperview()
      $0.centerX.equalToSuperview()
      $0.width.height.equalTo(UIScreen.screenWidth*0.6)
    }
    view.layoutIfNeeded()
    textView.snp.makeConstraints {
      let top = imageView.isHidden ? scrollView.snp.top : imageView.snp.bottom
      $0.top.equalTo(top).offset(20)
      $0.centerX.width.equalToSuperview()
      $0.width.equalToSuperview()
      $0.height.equalTo(420)
    }
    view.layoutIfNeeded()
  }
  // MARK: - Toolbar Setting
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
  
  @objc private func didTapEditOrDoneButton() {
    isEditingMode.toggle()
    if isEditingMode {
      editOrDoneButton.title = "완료" // 수정 모드 → 작성 완료 버튼으로 변경
      textView.isEditable = true // 텍스트 수정 가능하게 변경
      textView.becomeFirstResponder() // 키보드 자동으로 띄우기
    }else {
      editOrDoneButton.title = "수정" // 작성 완료 → 수정 버튼으로 변경
      textView.isEditable = false // 텍스트 수정 불가능하게 변경
      textView.resignFirstResponder() // 키보드 내리기
      (memoDate.customView as! UILabel).text = Date().dateToTime
      memoDate.customView?.sizeToFit()
      view.layoutIfNeeded()
    }
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
      imageView.image = selectedImage
      imageView.isHidden = false
      updateViewConstraints()
    }
    picker.dismiss(animated: true)
  }
}
