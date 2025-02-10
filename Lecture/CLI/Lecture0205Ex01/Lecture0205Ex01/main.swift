//
//  main.swift
//  Lecture0205Ex01
//
//  Created by 심근웅 on 2/5/25.
//

import Foundation
// 1. 구조체 객체를 선언
// 2. 함수 호출
print("실행 예제 번호 입력 : ", terminator: "")
let no: Int = Int(readLine()!)!
if no == 1 {
    // 객체 참조 변수를 이용해서 호출
    let ex01 = FunctionEx01()
    ex01.run()
}
if no == 2 {
    // 객체를 선언과 동시에 바로 호출
    FunctionEx02().run()
}
if no == 3 { FunctionEx03() }









