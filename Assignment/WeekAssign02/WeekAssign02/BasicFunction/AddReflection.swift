/*
 File: AddReflection.swift
 Purpose: 특정 날짜에 회고 내용을 추가
 
 Input Data
 - Date: String (yyyy-mm-dd)
 - Content: String
 Output Data
 - 회고를 추가하고 "회고가 추가되었습니다." 출력
 
 Warning
 -
*/

extension ReflectionSystem {
    func addReflection() {
        
    }
    /*
    func legacyAddReflection() { // 회고 추가
        while true {
            print("추가할 날짜를 입력하세요 (예: 2024-12-25): ", terminator: "")
            if let date = readLine(), validateDate(date: date) { // 날짜의 유효성 판단
                if reflections[date] == nil { // 회고가 존재하지 않음
                    while true { // 정상적인입력이 들어올때 까지 반복
                        print("회고 내용을 입력하세요: ", terminator: "")
                        if let content: String = readLine() {
                            if content == "" { //빈 내용을 입력
                                print("작성된 내용이 없습니다.\n")
                            }else {
                                let ref: Reflection = Reflection(date: date, content: content)
                                reflections[date] = ref
                                print("회고가 추가되었습니다.\n")
                                break
                            }
                        }else {
                            print("잘못된 입력입니다.\n")
                        }
                    }
                }else { // 회고가 존재함
                    print("회고가 이미 존재합니다.\n")
                }
                break
            }
        }
    }
    */
}
