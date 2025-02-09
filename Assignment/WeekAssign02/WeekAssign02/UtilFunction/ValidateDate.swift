/*
 File: ValidateDate.swift
 Purpose: 입력받은 날짜의 유효성 판단
 
 Input Data
 - date: String
 Output Data
 - Bool: true면 유효한 날짜, false면 유효하지 않은 날짜
 
 Warning
 -
*/
extension ReflectionSystem {
    // 유효성 검사
    func validateDate(date: String) -> Bool {
        // 입력 형식에 따른 검사
        let regex = /\d{4}\-(0[1-9]|1[012])\-(0[1-9]|[12][0-9]|3[01])/ // 정규식(yyyy-mm-dd)
        guard let _ = date.wholeMatch(of: regex) else {
            print("날짜의 입력형식이 잘못되었습니다.\n")
            return false
        }
        
        // 입력된 날짜에 따른 검사
        let dateArr: [String] = date.components(separatedBy: "-") // [0]: YYYY, [1]: MM, [2]: DD
        if dateArr[2] == "31", ["04", "06", "09", "11"].contains(dateArr[1]) {
            print("날짜가 유효하지 않습니다.\n")
            return false
        }else if dateArr[1] == "02", ["29","30","31"].contains(dateArr[2]) {
            print("날짜가 유효하지 않습니다.\n")
            return false
        }
        
        // 둘다 통과하면 입력은 정상적
        return true
    }
    func legacyValidateDate(date: String) -> Bool { // 날짜가 올바른 형식이고 날짜가 유효한지 판단
        let regex = /\d{4}\-(0[1-9]|1[012])\-(0[1-9]|[12][0-9]|3[01])/ // yyyy-mm-dd 형식의 정규식
        guard let dateMatch = date.wholeMatch(of: regex)?.output else { // 날짜의 형식이 맞지않음
            print("날짜의 입력이 잘못되었습니다.\n")
            return false
        }
        let month: String = String(dateMatch.1) // 월
        let day: String = String(dateMatch.2) // 일
        
        // 날짜가 유효하지 않음
        if (month == "04" || month == "06" || month == "09" || month == "11") && day == "31" { // 30일까지 있음
            print("날짜가 유효하지 않습니다.\n")
            return false
        }else if month == "02" && (day == "29" || day == "30" || day == "31") {
            print("날짜가 유효하지 않습니다.\n")
            return false
        }
        // 날짜가 유효함
        return true
    }
}
