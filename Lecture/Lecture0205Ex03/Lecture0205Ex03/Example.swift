//
//  Example.swift
//  Lecture0205Ex03
//
//  Created by 심근웅 on 2/5/25.
//

struct Example {
    func ex01() {
        print("Hello, World!")
        // 테스트
        // 가설 - 변수에 함수를 참조?
        
        // 함수를 선언
        func myFunc() {
            print("myFunc 호출")
        }

        // 함수를 호촐
        myFunc()

        // 변수에 함수를 담음(참조)
        var refFunc = myFunc
        refFunc()
    }
}
