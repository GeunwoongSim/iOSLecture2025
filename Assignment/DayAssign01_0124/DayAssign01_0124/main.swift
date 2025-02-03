// 문제 1
/*
// 월 입력: 11
// 일 입력: 21
// 1월 1일부터 11월 21일까지의 누적일은 0일입니다.
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

*/

// 문제 2
/*
// 월 입력: 11
// 일 입력: 21
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

