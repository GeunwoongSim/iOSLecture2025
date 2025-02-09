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
    private init() { }
    
    //프로그램 작동
    func run() {
        printMenu()
        userInputData()
    }
    /*
     func program() {
         let manager: ReflectionManager = ReflectionManager() // 회고시스템 생성
         manager.menuPrint() // 메뉴 출력
         
         while true { // 종료를 선택할 때 까지 반복
             print("메뉴를 선택하세요: ", terminator: "")
             
             if let input = readLine(), let menu = Int(input), menu >= 1 && menu <= 6 {
                 switch menu {
                 case 1 :
                     manager.addReflection()
                 case 2 :
                     manager.getReflection()
                 case 3 :
                     manager.updateReflection()
                 case 4 :
                     manager.deleteReflection()
                 case 5 :
                     manager.listAllReflections()
                 case 6, _ :
                     manager.closeReflection()
                     return
                 }
             }else {
                 print("잘못된 메뉴 선택입니다.\n")
             }
         }
     */
}
