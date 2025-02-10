/*
// 문제1)
let months: [Int] = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
var month: Int = 0
var day: Int = 0
var total: Int = 0
// 작업순서
// 1. 월과 일을 입력 받아서 저장
// 1-1. 월은 month, 일은 day에 저장
// 2. total 변수에 monthDays의 요소값 누적
// 2-1. 인덱스가 month - 1 보다 작을 때까지 누적하기 (0..<month-1)
// 3. total에 입력 month의 day를 추가

print("월 입력:",terminator: " ")
month = Int(readLine() ?? "") ?? 0
print("일 입력:",terminator: " ")
day = Int(readLine() ?? "") ?? 0

print("입력 된 날짜는 \(month)월 \(day)일입니다.")

total = 0 // 누적되는 변수는 초기화 필수
for i in 0..<month-1 {
    total += months[i]
}
total += day

print("1월 1일부터 \(month)월 \(day)일까지의 누적일은 \(total)일입니다.")
*/


/* // 수열 출력
// 1 - 2 + 3 - 4 + 5 - 6 + 7 - 8 + 9 - 10 = ??
var total = 0
var num = 1
let END = 10
var trig: Bool = true
while num <= 10 {
    print(num, terminator: num == 10 ? " = " : trig ? " - " : " + ")
    total = total + (trig ? num : -num)
    trig.toggle()
    num += 1
}
print(total)

//print((1...10).reduce(0){
//    print($1, terminator: $1 == 10 ? " = " : $1.isMultiple(of: 2) ? " + " : " - ")
//    return $0 + ($1.isMultiple(of: 2) ? -$1 : $1)
//})
*/
 
 
 
// 문제2) 월,일을 입력 받아서 100일 후의 월,일출력.
// 월 입력: 11
// 일 입력: 21
