/*
 ----- MENU -----
 1)INPUT 2)OUTPUT 3)SEARCH 4)EDIT 5)DELETE 6)CLOSE
 Chice: 1
 
 ----- 입력 기능 -----
 성명: 홍길동
 전화: 010-1111-1111
 
 ----- MENU -----
 1)INPUT 2)OUTPUT 3)SEARCH 4)EDIT 5)DELETE 6)CLOSE
 Chice: 2
 
 ----- 출력 기능 -----
 
 ----- MENU -----
 1)INPUT 2)OUTPUT 3)SEARCH 4)EDIT 5)DELETE 6)CLOSE
 Chice: 3
 
 ----- 이름 검색 기능 -----
 */
struct PhoneBook {
    // 새로운 기능을 추가할때는 menuItems에 이름, FUNC에 함수 추가
    var menuItems: [String] = ["INPUT", "OUTPUT", "SEARCH", "EDIT", "DELETE", "CLOSE"] // 메뉴명
    func run() {
        let FUNC = [inputMode, outputMode, searchMode, editMode, deleteMode, closeMode]
        while true { // 메뉴 실행
            printMenu()
            let input = userInput() // 사용자 입력받음
            FUNC[input-1]()
            if input == menuItems.count { return }
            print()
        }
    }
    func printMenu() { // 메뉴 출력
        print("----- MENU -----")
        for (i,item) in menuItems.enumerated() {
            print("\(i+1))\(item)", terminator: " ")
        }
        print()
    }
}
