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
        
    }
    /*
     func listAllReflections() { // 전체 회고 출력
         let sortedDic = reflections.sorted{ $0.key < $1.key }
         print("=== 저장된 회고 목록 ===")
         if reflections.count == 0 {
             print("저장된 회고가 없습니다.")
         }else {
             for reflection in sortedDic {
                 print("날짜: \(reflection.value.date)")
                 print("내용: \(reflection.value.content)\n")
             }
         }
         print("====================\n")
     }
     func closeReflection() { // 종료
         print("프로그램을 종료합니다.")
     }
     */
}
