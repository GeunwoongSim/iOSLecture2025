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
    var DB: [String:Reflection] = [:]
    private init() { }
}
