/*
 File: ExitProgram.swift
 Purpose: 프로그램을 종료하기 위한 파일
 
 Data
 - power: Bool // 처음 System이 가능되면 true가 되고 exit를 작동하면 false가 되어 반복문 종료

 etc
 - 
*/
extension ReflectionSystem {
    func exitProgram() {
        power.toggle()
        print("================")
        print("================")
        print("****************")
        print("프로그램을 종료합니다")
        print("****************")
        print("================")
        print("================")
    }
}
