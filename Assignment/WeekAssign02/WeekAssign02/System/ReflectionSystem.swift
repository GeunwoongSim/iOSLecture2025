/*
 File: ReflectionSystem.swift
 Purpose: 회고 시스템의 바디 프로그램
 
 Input Data
 - 파일에서 처리하는 기능에 대한 입력, 전달 값
 Output Data
 - 파일에서 처리한 내용에 대한 출력, 반환 값
 
 Warning
 -
*/

class ReflectionSystem {
    static let shared = ReflectionSystem() // 외부 호출용 싱글톤
    let db = ReflectionSystemDB.shared.DB
    var power: Bool = false
    private init() { }
    //프로그램 작동
    func run() {
        self.power.toggle()
        printMenuBoard() // 메뉴판 출력
        while power {
            executeMenu(menu: userMenuInput())
        }
    }
}
