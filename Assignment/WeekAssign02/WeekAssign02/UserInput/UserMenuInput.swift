/*
 File: UserMenuInput.swift
 Purpose: 유저의 메뉴 입력을 받는 함수
 
 Data
 - input: String // 입력받은 메뉴의 String값
 - menu: Int // String값을 Int로 캐스팅, 이때 1~6이 아니면 잘못된메뉴 선택으로 -1반환, 아니면 1~6 반환

 etc
 - 
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
