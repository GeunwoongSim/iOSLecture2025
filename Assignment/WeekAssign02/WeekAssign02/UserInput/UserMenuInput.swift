/*
 File: UserInputData.swift
 Purpose: 유저의 메뉴 입력을 받는 함수
 
 Input Data
 - 사용자가 String을 입력
 Output Data
 - 입력한 결과값을 출력
 
 Warning
 - 입력으로 이상한 값이 들어올 수 있음 or nil 입력
*/

extension ReflectionSystem {
    func userMenuInput() -> Int {
        print("메뉴를 선택하세요: ", terminator: "")
        guard let input = readLine(), let menu = Int(input), menu >= 1 && menu <= 6 else {
            print("잘못된 메뉴 선택입니다.\n")
            return -1
        }
        return menu
    }
}
