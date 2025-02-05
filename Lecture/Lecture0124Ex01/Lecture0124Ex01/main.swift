/*
 1단계
 높다 낮다 게임 구현
 시스템이 1~100 사이의 난수를 발생
 사용자가 정답을 입력해서 맞추는 프로그램
 6회 시도 안에 맞추는 프로그램
 
 2단계
 한 게임이 끝나면 재시도 여부 물어 보기
 재시도 하면 모든 변수가 초기화 되면서 다시 시작
 */
import Foundation

while true {
    let min = 1, max = 100 // 난수 발생을 위한 최소,최대값
    var canMin = 1, canMax = 100 // 사용자가 입력가능한 최소, 최대 범위
    var userNum: Int = 0 // 사용자가 입력한 숫자
    let randNum = Int.random(in: min...max) // 1. 난수를 발생
    var leftNum = 6 //남은 횟수
    var result: Bool = false
    print(":::: 높다 낮다 게임 ::::")
    print("시스템이 \(min)~\(max) 사이의 번호를 하나 선택했습니다. (힌트: \(randNum))")
    print("6회 시도 안에 정답을 맞춰 보세요.")

    // 5. 오답일 경우 새로운 숫자 입력
    while userNum != randNum && leftNum > 0{
        // 3. 유효성검사 - 입력가능한 숫자인지 확인
        while userNum < canMin || userNum > canMax {
            // 2. 숫자를 입력받음
            print("숫자를 입력하세요 (\(canMin)~\(canMax)): ", terminator: "")
            if let input = readLine(), let number = Int(input) {
                userNum = number
            }else {
                print("잘못된 입력입니다.")
            }
        }
        if userNum == randNum {
            result = true
            print("정답입니다")
        }
        else {
            leftNum -= 1 // 6. 횟수 제한
            // 7. 입력한 결과에 따라 입력 가능한 값 조절
            if userNum > randNum { // 입력한 값이 정답보다 큰 경우
                canMax = userNum-1
                print("오답입니다 \(userNum)보다 작습니다 (남은횟수: \(leftNum))")
            }
            else if userNum < randNum { // 입력한 값이 정답보다 작은 경우
                canMin = userNum+1
                print("오답입니다 \(userNum)보다 큽니다 (남은횟수: \(leftNum))")
            }
        }
    }
    // 4. 결과를 출력
    print("결과: \(result ? "정답" : "오답")")
    print("======================")
    // 9. y,n이 아니면 다시 입력을 받도록
    var yn:String = ""
    repeat{
        // 8. 한게임 끝난 후 다시 할지 선택
        print("다시하시겠습니까? (Y/N) : ",terminator: "")
        yn = (readLine() ?? "").uppercased()
    }while yn != "Y" && yn != "N"
    print("======================")
    if yn == "N" { break }
}



