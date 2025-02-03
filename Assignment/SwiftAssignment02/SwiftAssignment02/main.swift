struct Reflection { // 회고
    let date: String
    var content: String
}

class ReflectionManager { // 회고 시스템
    private var reflections: [String: Reflection] = [:]
    
    func validateDate(date: String) -> Bool { // 날짜가 올바른 형식이고 날짜가 유효한지 판단
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
    func menuPrint() {
        print(" === 회고 시스템 === ")
        print("1. 회고 추가") // 1.addReflection()
        print("2. 회고 조회") // 2.getReflection()
        print("3. 회고 수정") // 3.updateReflection()
        print("4. 회고 삭제") // 4.deleteReflection()
        print("5. 전체 회고 목록 출력") // 5.listAllReflections()
        print("6. 종료\n")
    }
    func addReflection() { // 회고 추가
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
    func getReflection() { // 회고 조회
        while true {
            print("조회할 날짜를 입력하세요 (예: 2024-12-25): ", terminator: "")
            if let date = readLine(), validateDate(date: date) { // 날짜의 유효성 판단
                if let data = reflections[date] {
                    print("날짜: \(date)")
                    print("내용: \(data.content)\n")
                }else {
                    print("회고가 존재하지 않습니다.\n")
                }
                break
            }
        }
    }
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
}

func program() {
    let manager: ReflectionManager = ReflectionManager() // 회고시스템 생성
    manager.menuPrint() // 메뉴 출력
    
    while true { // 종료를 선택할 때 까지 반복
        print("메뉴를 선택하세요: ", terminator: "")
        
        if let input = readLine(), let menu = Int(input), menu >= 1 && menu <= 6 {
            switch menu {
            case 1 :
                manager.addReflection()
            case 2 :
                manager.getReflection()
            case 3 :
                manager.updateReflection()
            case 4 :
                manager.deleteReflection()
            case 5 :
                manager.listAllReflections()
            case 6, _ :
                manager.closeReflection()
                return
            }
        }else {
            print("잘못된 메뉴 선택입니다.\n")
        }
    }
}

program()
