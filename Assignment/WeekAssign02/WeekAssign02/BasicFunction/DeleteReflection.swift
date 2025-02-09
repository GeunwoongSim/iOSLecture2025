/*
 File: DeleteReflection.swift
 Purpose: 특정 날짜의 회고 내용을 삭제
 
 Input Data
 - 파일에서 처리하는 기능에 대한 입력, 전달 값
 Output Data
 - 파일에서 처리한 내용에 대한 출력, 반환 값
 
 Warning
 -
*/

extension ReflectionSystem {
    func deleteReflection() {
    }
    /*
     func deleteReflection() { // 회고 삭제
         while true {
             print("삭제할 날짜를 입력하세요 (예: 2024-12-25): ", terminator: "")
             if let date = readLine(), validateDate(date: date) { // 날짜의 유효성 판단
                 if reflections[date] == nil {
                     print("회고가 존재하지 않습니다.\n")
                 }else {
                     reflections[date] = nil
                     print("회고가 삭제되었습니다.\n")
                 }
                 break
             }
         }
     }
     */
}
