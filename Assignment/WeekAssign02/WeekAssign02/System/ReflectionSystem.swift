/*
 File: ReflectionSystem.swift
 Purpose: 회고 시스템의 바디 프로그램
 
 Data
 - shared // 회고 시스템의 호출용 싱글톤
 - db: ReflectionSystemDB // 회고 시스템 DB의 외부 호출용 싱글톤
 - power: Bool // 회고 시스템을 작동(run)하면 true되며, 종료(exit)하면 false로 바뀜

 etc
 - 여기선 회고 시스템의 작동만 담당하고 실제 작동은 executeMenu에서 실행
 - class이니까 protocol 사용도 좋을듯
*/
class ReflectionSystem {
    static let shared = ReflectionSystem() // 외부 호출용 싱글톤
    let db = ReflectionSystemDB.shared
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
