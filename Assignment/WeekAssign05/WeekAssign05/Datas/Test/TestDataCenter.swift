//
//  DummyDat.swift
//  WeekAssign05
//
//  Created by 심근웅 on 3/8/25.
//

import Foundation

final class TestDataCenter {
  static var shared: TestDataCenter = TestDataCenter()
  let memoDummy: [MemoModel] = [
    MemoModel(title: "제목1", content: "테스트1", date: Date()),
    MemoModel(title: "제목2", content: "테스트2", date: Date()),
    MemoModel(title: "제목3", content: "테스트3", date: Date()),
    MemoModel(title: "제목4", content: "테스트4", date: Date()),
    MemoModel(title: "제목5", content: "테스트5", date: Date()),
    MemoModel(title: "제목6", content: "테스트6", date: Date()),
    MemoModel(title: "제목7", content: "테스트7", date: Date()),
    MemoModel(title: "제목8", content: "테스트8", date: Date()),
    MemoModel(title: "제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목제목1", content: "테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트", date: Date())
  ]
}


