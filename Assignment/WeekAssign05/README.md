

## 메모 어플

|이름|이미지|내용|
|---|---|---|
|메인 테이블 뷰|<img src = "https://github.com/user-attachments/assets/312daa6d-5a6a-4fd2-85e9-05682598af55" width ="250">|테이블 뷰로 메모 목록을 보여줌|
|메인 컬렉션 뷰|<img src = "https://github.com/user-attachments/assets/84451dc9-734f-49f9-9e7a-1b36eafa530c" width ="250">|컬렉션 뷰로 메모 목록을 보여줌|
|메모 작성 화면|<img src = "https://github.com/user-attachments/assets/57cd33b7-f389-4734-bf68-ce743e83b075" width ="250">|툴바 왼쪽 버튼으로 사진 추가 가능|

## 주요 기능

1. 메모 관리 화면
    - 사용자가 새로운 메모를 추가 할 수 있음
    - 추가된 메모는 컬렉션뷰를 통한 갤러리형태, 테이블뷰를 통한 목록 형태로 확인 가능
    - Core Data를 사용해 앱을 종료해도 정보 유지
2. 메모 작성 화면 - 사진
    - 사용자가 사진을 선택해 추가 가능
    - UIImagePickerController를 사용해 사진을 가져오고 사진은 Core Data에 저장
3. 메모 작성 화면 - 텍스트
    - 텍스트뷰를 사용해 메모를 작성
    - Title Bar에 메모 제목을 입력
4. 메모 확인 화면
    - 수정 버튼을 이용해 수정화면으로 넘어갈 수 있음

## 프레임워크
- UIKit
- CoreData

## 라이브러리
- Then
- Snap Kit

## 프로젝트 구성
```bash
WeekAssign05/
├── Models/
│   ├── MemoModel.swift
│   ├── MemoContentMode.swift
│   └── MemoDetailMode.swift
├── Views/
│   ├── MemoCollectionCell.swift
│   └── MemoTableCell.swift
├── Controllers/
│   ├── HomeViewController.swift
│   └── MemoDetailViewController.swift
├── Extension
│   ├── Date+Extension.swift
│   └── UIScreen+Extension.swift
├── Utill
│   ├── AppDelegate.swift
│   ├── Constants.swift
│   └── SceneDelegate.swift
├── Resources/
│   ├── Info.plist
│   └── Assets.xcassets
└── Data
    ├── MemoDatas.xcdatamodeld
    └── DataManager.swift
```