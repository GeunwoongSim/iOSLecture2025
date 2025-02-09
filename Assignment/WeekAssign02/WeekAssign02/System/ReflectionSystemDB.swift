/*
 File: ReflectionSystemDB.swift
 Purpose: 회고 시스템의 DB
 
 Data
 - shared // DB의 호출용 싱글톤
 - DB: [String:Reflection] // Key: date(String), Value: Reflection인 회고를 저장하는 DB 역할

 etc
 - 간단한 내용으로 작성되어 있어 한 파일로 사용
 - class이니까 protocol 사용도 좋을듯
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
    func dbSearchAll() -> [Reflection] { // db의 내용을 반환
        return DB.values.sorted{ $0.date < $1.date ? true : false }
    }
    func dbDelete(date: String) -> Reflection? { // db에서 회고를 삭제 후 반환
        return DB.removeValue(forKey: date)
    }
}
