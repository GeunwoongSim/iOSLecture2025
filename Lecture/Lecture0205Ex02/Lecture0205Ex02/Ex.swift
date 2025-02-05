/*
class PhoneBook1 {
    let MENU_TITLE = "----- PHONE BOOK -----"
    let menuItems: [String] = ["INPUT", "OUTPUT", "SEARCH", "EDIT", "DELETE", "END"]
    var isDone: Bool = false





    func search() {
        print("---- 검색 기능 ----")
        print("친구 전화번호를 검색 합니다.")
    }

    func edit() {
        print("---- 수정 기능 ----")
        print("친구 정보를 수정합니다.")
    }

    func delete() {
        print("----  삭제 ----")
        print("친구를 드롭 합니다. ")
    }

    func end() {
        print("---- 프로그램 종료 ----")
        print("수고하셨습니다. 다음 기회에 또 만나요.")
        self.isDone = true
    }

    var factory:[Any] = [Input(), Output(), Search(), Edit(), Delete(), End()]

    func paly() {
//        var no = menu(menuItems: menuItems)
//        if let input = factory[0] as? Input {
//            input.run()
//        }

        if no == 1 {
            input()
        }
        if no == 2 {
            output()
        }
        if no == 3 {
            search()
        }
        if no == 4 {
            edit()
        }
        if no == 5 {
            delete()
        }
        if no == 6 {
            end()
        }
    }

    func run() {
        while !isDone {
            paly()
        }
    }

    func menu(menuItems: [String]) -> Int {
        var no = 0
        repeat {
            print(MENU_TITLE);
            for (i, item) in menuItems.enumerated(){
                print("[(i+1)](item)", terminator: " ")
            }
            print("\nChoice", terminator: ": ")
            no = Int(readLine() ?? "") ?? 0
        } while (no<1 || no>menuItems.count)

        return no
    }
}
*/
