/*
 File: UserDateInput.swift
 Purpose: 유저가 날짜를 입력
 
 Data
 - date: String // 이상한 입력이 들어와 nil이 되는것만 확인 나머지 유효성은 validateDate로 위임

 etc
 -
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
