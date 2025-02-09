/*
 File: EditReflection.swift
 Purpose: 특정 날짜의 회고 내용을 수정
 
 Input Data
 - 파일에서 처리하는 기능에 대한 입력, 전달 값
 Output Data
 - 파일에서 처리한 내용에 대한 출력, 반환 값
 
 Warning
 -
*/


extension ReflectionSystem {
    func editReflection() {
        
    }
    /*
     func updateReflection() { // 회고 수정
         while true {
             print("수정할 날짜를 입력하세요 (예: 2024-12-25): ", terminator: "")
             if let date = readLine(), validateDate(date: date) { // 날짜의 유효성 판단
                 if reflections[date] != nil {
                     while true { // 정상적인입력이 들어올때 까지 반복
                         print("새로운 회고 내용을 입력하세요: ", terminator: "")
                         if let content: String = readLine() {
                             if content == "" { //빈 내용을 입력
                                 print("작성된 내용이 없습니다.\n")
                             }else {
                                 let ref: Reflection = Reflection(date: date, content: content)
                                 reflections[date] = ref
                                 print("회고가 수정되었습니다.\n")
                                 break
                             }
                         }else {
                             print("잘못된 입력입니다.\n")
                         }
                     }
                 }else {
                     print("회고가 존재하지 않습니다.\n")
                 }
                 break
             }
         }
     }
     */
}
