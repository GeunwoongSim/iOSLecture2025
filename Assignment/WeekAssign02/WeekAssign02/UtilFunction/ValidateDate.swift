/*
 File: ValidateDate.swift
 Purpose: 입력받은 날짜의 유효성 판단
 
 Data
 - date: String // 1차 검사로 nil이 아닌 값이 들어옴
 - regex: 정규식 // yyyy-mm-dd 그중에서도 mm은 01~09,10~12까지, dd는 01~09,10~29,30,31만 가능하다
 - dateArr: [String] // [0]: yyyy, [1]: mm, [2]: dd 형태
 
 etc
 - 정규식을 활용한 date.wholeMatch(of: regex)는 판단만 하면 되서 '_' 처리
 - 2월과 30일까지인 달 처리가 먼가 예쁘지 않다. 나중에 하나로 합쳐보자
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
        let dateArr: [String] = date.components(separatedBy: "-")
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
