/*
 File: PrintMenu.swift
 Purpose: 회고 시스템의 메뉴 출력
 
 Input Data
 - 파일에서 처리하는 기능에 대한 입력, 전달 값
 Output Data
 - 파일에서 처리한 내용에 대한 출력, 반환 값
 
 Warning
 -
*/

extension ReflectionSystem {
    func printMenuBoard() {
        print("==== 회고 시스템 ====")
        print("1. 회고 추가")
        print("2. 회고 조회")
        print("3. 회고 수정")
        print("4. 회고 삭제")
        print("5. 전체 회고 목록 출력")
        print("6. 종료\n")
    }
}
