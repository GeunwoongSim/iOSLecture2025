//
//  main.swift
//  SwiftDay03Ex02
//
//  Created by 심근웅 on 1/24/25.
//

import Foundation
/*
print("Hello, World!")

var arr: [Int] = []
let arr1: [Int] = [33,44,56,78]

arr.append(100)
arr.append(101)
arr.append(102)
arr.append(103)

print(arr)

for number in arr { print(number,terminator: " ") }
print()

arr.remove(at: 2)
print(arr)

print(arr[1])

print((arr + arr1).sorted())
*/
/*
// 각 월의 날짜수를 저장한 배열.
let monthDays: [Int] = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
var month: Int = 0
var days: Int = 0
var total: Int = 0

// 날짜 수를 알고자 하는 달 입력: 2
// 결과 2월 28일까지 있다.

print("날짜 수를 알고자 하는 달 입력: ",terminator: "")
if let input = readLine(), let num = Int(input) {
    month = num
    days = monthDays[month-1]
}
print("결과 \(month)월은 \(days)일까지 있다.")

// monthDays를 이용해서 1년은 365일까지 있다는 것을 출력
// total변수에 monthDays의 모든 요소를 for in으로 누적
for day in monthDays {
    total += day
}
print("1년은 \(total)일까지 있다")

for (idx, day) in monthDays.enumerated() {
    print("monthsDays[\(idx)] = \(day)")
}
*/

// 문제1) 특정 월,일을 입력 바아서 1월1일 부터 입력 된 월,일까지의 누적 날짜 수 출력
// 예)
// 월 입력: 4
// 일 입력: 10
// 1월 1일부터 4월 10일까지의 누적일은 100일입니다.

let months: [Int] = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
var total: Int = 0
print("월 입력: ", terminator: "")
var month: Int = Int(readLine() ?? "1") ?? 1
print("일 입력: ", terminator: "")
var day: Int = Int(readLine() ?? "1") ?? 1
for idx in 0..<month-1 {
    total += months[idx]
}
total += day
print("1월 1일부터 \(month)월 \(day)일까지의 누적일은 \(total)일입니다.")


/*
// 문제2) 월,일을 입력 받아서 100일 후의 월,일출력
// 월 입력: 11
// 일 입력: 21
// 11월 21일의 100일 후는 0월 0일입니다.
let months: [Int] = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
print("월 입력: ", terminator: "")
var month: Int = Int(readLine() ?? "1") ?? 1
print("일 입력: ", terminator: "")
var day: Int = Int(readLine() ?? "1") ?? 1


//입력 받은 날짜를 일로 변경 - 1년을 넘어가는 경우 처리
var convertDay: Int = 0
for idx in 0..<month-1 {
    convertDay += months[idx] // 월을 일로 변경
}
convertDay = (convertDay + day + 100) % 365

//일을 월과 일로 나눔
var dm: Int = 0
var dd: Int = 0
var total: Int = 0
for (idx,m) in months.enumerated(){
    if convertDay < total + m {
        dm = idx+1
        dd = convertDay - total
        break
    }
    total = total + m
}
print("\(month)월 \(day)일의 100일 후는 \(dm)월 \(dd)일입니다.")
*/
