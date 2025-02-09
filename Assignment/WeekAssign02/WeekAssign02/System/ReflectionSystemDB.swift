/*
 File: ReflectionSystemDB.swift
 Purpose: 회고 시스템에서 사용할 싱글톤 작성
 
 Input Data
 - 파일에서 처리하는 기능에 대한 입력, 전달 값
 Output Data
 - 파일에서 처리한 내용에 대한 출력, 반환 값
 
 Warning
 -
*/

class ReflectionSystemDB {
    static let shared = ReflectionSystemDB()
    private var DB: [String:Reflection] = [:]
    private init() { }
    
    func dbInsert(date: String, content: Reflection) -> Bool { // db에 회고를 저장 후 결과 반환
        DB[date] = content
        return DB[date] != nil ? true : false
    }
    func dbSearch(date: String) -> Reflection? { // db에 회고를 찾아서 반환
        return DB[date]
    }
    func dbSearchAll() -> [(String, Reflection)]{
        return DB.sorted(by: {
            if $0.key < $1.key { return true }
            else { return false }
        })
    }
}
