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
    func run() {
        while true {
            printMenu() // 메뉴 출력
            let input = userInput() // 사용자 입력받음
            // 입력에 따른 메뉴 실행
            if input == 1 { inputMode() }
            else if input == 2 { outputMode() }
            else if input == 3 { searchMode() }
            else if input == 4 { editMode() }
            else if input == 5 { deleteMode() }
            else if input == 6 {
                clodeMode()
                break
            }
            print()
        }
    }
    func printMenu() { // 메뉴 출력
        print("----- MENU -----")
        print("1)INPUT 2)OUTPUT 3)SEARCH 4)EDIT 5)DELETE 6)CLOSE")
    }
}
