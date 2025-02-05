//
//  FunctionEx.swift
//  Lecture0205Ex01
//
//  Created by 심근웅 on 2/5/25.
//

import Foundation

struct FunctionEx01 {
    func run() {
        print("run FunctionEx")
        example01(title: "더하기 예제")
    }
}

extension FunctionEx01 {
    func example01(title: String){
        print("첫번째 예제는 \(title)입니다.")
        
        let value1 = 100, value2 = 50
        let total = add(x: value1, y: value2)
        print("\(value1) 더하기 \(value2)는 \(total)입니다")
    }
    func add(x: Int, y: Int) -> Int {
        let sum: Int = x + y
        return sum
    }
}
