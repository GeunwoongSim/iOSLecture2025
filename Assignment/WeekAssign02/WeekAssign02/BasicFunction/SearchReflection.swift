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
        guard let date = userDateInput(how: "조회") else { return }
        guard let searchResult = db.dbSearch(date: date) else {
            print("회고가 존재하지 않습니다.\n")
            return
        }
        print("날짜: \(searchResult.date)")
        print("내용: \(searchResult.content)\n")
    }
}
