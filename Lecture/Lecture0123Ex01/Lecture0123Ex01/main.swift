//
//  main.swift
//  SwiftDay02Ex01
//
//  Created by 심근웅 on 1/23/25.
//
// 이것은 한줄 주석입니다.
/*
 이것은
 여러줄 주석입니다.
 /*
  중첩된 여러줄 주석
  */
 */

/*
import Foundation

//단문 복문, 한줄에 복문으로 작성 시 ;사용
let 안녕 = "안녕하세요."
var hello = "Hello, World!"
print(hello, terminator: "")
print(안녕)

// 변수는 값을 변경 할 수 있다.
hello = "안녕 세상"
print(hello, terminator: "\n")
// 특수 문자 \n \t \r \a ...
// 터미네이터 속성의 기본값(default)은 teminator: "\n"
*/

// 이전 예제를 주석 처리 하고 다음 예제 실습

/*
// readLine()으로 데이터 입력

// 성명과 나이를 입력 받아서 출력하는 예제
// 나이의 5년 후 나이를 출력하라.
// 성명은 상수로 선언
// 나이는 변수로 선언

// 변수나 상수는 맨위에 선언하는 것이 일반적이다.
// 성명과 나이를 입력 받을 변수 선언
var name: String = ""
var age: Int = 0

print("성명 입력: ",terminator: "")
//name = readLine() ?? ""
if let input = readLine() {
    name = input
} else {
    name = ""
}
print("나이 입력: ",terminator: "")
age = Int(readLine() ?? "0") ?? 0

// 변수는 값을 바꿔 줄 수 있다.
age = age + 5

print("\(name)님의 나이는 \(age)입니다.")
*/


/*
// 옵셔널의 값 확인 (언랩핑)

var name: String? = nil

name = "홍길동"

let userName = name ?? "noname"
print("성명은 " + userName  + "입니다.")
*/

/*
import Foundation

print("점수를 입력하세요: ",terminator: "")
let grade: Int = Int(readLine() ?? "0") ?? 0
switch grade {
case 90...100:
    print("학점 A")
case 80..<90:
    print("학점 B")
case 70..<80:
    print("학점 C")
case 60..<70:
    print("학점 D")
default:
    print("학점 F")
}

*/

/*
let size = 10
var total: Int = 0
for num in 1...size {
    if num == 10 { print("\(num)", terminator: " = ") }
    else { print("\(num)", terminator: " + ") }
//    print("\(num)", terminator: num == 10 ? " = " : " + ")
    total += num
}
print(total)
//print("1부터 10까지의 누적은 \(total)입니다.")
*/


// 체크 타임 문제
// 문제1 : 1부터 10까지 정수를 누적 합산하여 출력
//import Foundation
//var total: Int = 0
//for num in 1...10 {
//    total += num
//}
//print("Total: \(total)")

// 문제2 : 1부터 100까지 홀수만 누적 합산하여 출력
//import Foundation
//var total: Int = 0
//for num in 1...100 {
//    if num % 2 != 0 { total += num }
//}
//print("Total of odd numbers: \(total)")

// 문제3 : while 반복문으로 1부터 5까지 출력
//import Foundation
//var num = 1
//while num <= 5 {
//    print(num)
//    num += 1
//}

// 문제4 : repeat-while로 10에서 1까지 출력
//import Foundation
//var num: Int = 10
//repeat {
//    print(num)
//    num -= 1
//}while num >= 1

// 문제5 : 피보나치 수열
//var num1: Int = 0
//var num2: Int = 1
//var sum: Int = 0
//var i: Int = 0
//
//print("피보나치 수열: ", terminator: "")
//while i < 10 {
//    print(num1, terminator: i == 9 ? "\n" : ", ")
//    sum += num1
//
//    let next = num1 + num2
//    num1 = num2
//    num2 = next
//    i += 1
//}
//print("합계: \(sum)")
