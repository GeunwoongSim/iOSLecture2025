//
//  FunctionEx02.swift
//  Lecture0205Ex01
//
//  Created by 심근웅 on 2/5/25.
//

import Foundation

struct FunctionEx02 {
    func run() {
        print("FunctionEx02.run()")
        
        // 다중 변환 값 예제
        let userInfo: (name: String, age: Int) = getUserInfo()
        print("\(userInfo.name)님은 \(userInfo.age)세 입니다.")
    }
    // 이름과 나이를 입력 받는 함수
    func getUserInfo() -> (String, Int) {
        print("성명: ",terminator: "")
        let name: String = readLine() ?? "name"
        print("나이: ",terminator: "")
        let age: Int = Int(readLine() ?? "") ?? 0
        
        return (name,age)
//        print("성명과 나이를 입력 하세요.")
//        return (name: readLine()!, age: Int(readLine()!)!)
    }
}
