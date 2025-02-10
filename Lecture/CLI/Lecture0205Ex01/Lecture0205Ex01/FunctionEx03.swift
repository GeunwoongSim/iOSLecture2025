//
//  FunctionEx03.swift
//  Lecture0205Ex01
//
//  Created by 심근웅 on 2/5/25.
//

import Foundation

struct FunctionEx03 {
    init() {
        // 객체(인스턴스)를 생성하면 바로 실행
        print("FunctionEx03 init 실행")
        
        // 옵셔널을 반환 하는 함수 호출
        if let result: String = getName() {
            print("\(result)님 안녕하세요")
        }else {
            print("값이 유효하지 않습니다.")
        }
    }
}

extension FunctionEx03 {
    func getName() -> String? {
        return "HONG"
    }
}
