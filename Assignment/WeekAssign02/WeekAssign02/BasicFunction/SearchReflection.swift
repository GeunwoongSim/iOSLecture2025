/*
 File: SearchReflection.swift
 Purpose: 특정 날짜의 회고 내용을 검색
 
 Data
 - date: String
 - searchResult: Reflection? // 회고가 존재하지 않으면 nil

 etc
 - 추가적인 설명, 나중에 바꾸면 좋겠는것 등을 작성
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
