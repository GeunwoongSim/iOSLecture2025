/*
 File: PrintAllReflection.swift
 Purpose: 날짜별 회고 목록을 출력
 
 Input Data
 - 파일에서 처리하는 기능에 대한 입력, 전달 값
 Output Data
 - 파일에서 처리한 내용에 대한 출력, 반환 값
 
 Warning
 -
*/

extension ReflectionSystem {
    func printAllReflection() {
        let reflections: [Reflection] = db.dbSearchAll()
        print("=== 저장된 회고 목록 ===")
        if reflections.isEmpty { print("저장된 회고가 없습니다.") }
        else {
            for (idx, reflection) in reflections.enumerated() {
                print("날짜: \(reflection.date)")
                print("내용: \(reflection.content)")
                if idx != reflections.count - 1 {
                    print("--------------------")
                }
            }
        }
        print("====================\n")
    }
}
