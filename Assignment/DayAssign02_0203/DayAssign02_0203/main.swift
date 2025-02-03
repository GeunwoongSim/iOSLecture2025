// 오늘의 퀴즈
// 문제1. 피보나치 수열 출력
let MAX: Int = 21 // 수열 값이 MAX 이하 일때 진행
var num1: Int = 0
var num2: Int = 1
var total: Int = 0
while num2 <= MAX {
    // 수열 구하기
    let temp = num1
    num1 = num2
    num2 = temp + num1
    // 합계 구하기
    total += num1
    // 출력하기
    print(num1, terminator: "")
    if num2 <= MAX { print(" + ", terminator: "") }
    else { print(" = ", terminator: "") }
}
print(total)


/*
// 문제2. 피보나치 수열 출력 (부호 엇갈리게)
let MAX: Int = 21 // 수열 값이 MAX 이하 일때 진행
var num1: Int = 1
var num2: Int = 1
var total: Int = 1
var flag: Bool = true
print(num1, terminator: "")
while num2 <= MAX {
    let temp = num1
    num1 = num2
    num2 = temp + num1
    
    print(flag ? " + " : " - ", terminator: "")
    print(num1, terminator: "")
    total += (flag ? num1 : -num1)
    flag.toggle()
}
print(" = \(total)")
*/
