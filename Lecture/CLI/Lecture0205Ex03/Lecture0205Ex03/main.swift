//
//  main.swift
//  Lecture0205Ex03
//
//  Created by 심근웅 on 2/5/25.
//

import Foundation

//Example().ex01()

//func mult(a: Int, b: Int) -> Int {
//    let result = a + b
//    return result
//}
//
////클로저(익명함수)로 구현
////{ (매개변수) -> 리턴형 in 처리 }
//let multiply = { (a:Int, b: Int) -> Int in return a * b}
//// 클로저 호출 - 매개변수 라벨 생략
//let result = multiply(5, 3)
//print(result)

/*
let numbers: [Int] = [1,2,3,4,5]
//let newNumbers: [Int] = numbers.map({ (number: Int) -> Int in return number * 5 })
let newNumbers: [Int] = numbers.map{ $0 * 5 }
print(newNumbers)
print(numbers)

let sortedArr = numbers.sorted{ $0 > $1 }
print(sortedArr)
*/

let numbers: [Int] = [4,5,3,1,2]
print(numbers)
func multi(num: Int) -> Int {
    return num * 5
}
let newNumbers1: [Int] = numbers.map(multi)
let newNumbers2: [Int] = numbers.map({ (number: Int) -> Int in return number * 5 })
print(newNumbers1)


func compa(a: Int, b: Int) -> Bool{
    return a > b
}
let sortedArr1 = numbers.sorted(by: compa)
let sortedArr2 = numbers.sorted{ $0 > $1 }
print(sortedArr1)
