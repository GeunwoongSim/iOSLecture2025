/*
 File: UserDateInput.swift
 Purpose: 유저가 날짜를 입력
 
 Input Data
 - Date: String (yyyy-mm-dd)
 Output Data
 - Date: String (yyyy-mm-dd)
 
 Warning
 - Date의 형식이 맞지 않을 수 있음
 - Date의 형식은 맞지만 유효하지 않은 값일 수 있음
 - Content가 ""일 수 있음 또는 String으로 받지 못하는 것일 수 있음(이러면 nil이 들어오나?)
*/

extension ReflectionSystem {
    func userDateInput(how: String) -> String? {
        print("\(how)할 날짜를 입력하세요 (예: 2024-12-25): ", terminator: "")
        guard let date = readLine() else {
            print("잘못된 입력입니다.")
            return nil
        }
        // 유효성 검사 후 괜찮으면 date를 반환 아니면 nil
        return validateDate(date: date) ? date : nil
    }
}
