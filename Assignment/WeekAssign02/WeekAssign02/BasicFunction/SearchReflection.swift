/*
 File: SearchReflection.swift
 Purpose: 특정 날짜의 회고 내용을 검색
 
 Input Data
 - 파일에서 처리하는 기능에 대한 입력, 전달 값
 Output Data
 - 파일에서 처리한 내용에 대한 출력, 반환 값
 
 Warning
 -
*/


extension ReflectionSystem {
    func searchReflection() {
        
    }
    /*
    func legacyGetReflection() { // 회고 조회
        while true {
            print("조회할 날짜를 입력하세요 (예: 2024-12-25): ", terminator: "")
            if let date = readLine(), validateDate(date: date) { // 날짜의 유효성 판단
                if let data = reflections[date] {
                    print("날짜: \(date)")
                    print("내용: \(data.content)\n")
                }else {
                    print("회고가 존재하지 않습니다.\n")
                }
                break
            }
        }
    }
    */
}
