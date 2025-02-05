// 사용자의 입력을 받아서 반환(안정성)

extension PhoneBook {
    func userInput() -> Int {
        while true {
            print("Choice: ", terminator: "")
            guard let input: Int = Int(readLine() ?? ""), (input >= 1 && input <= self.menuItems.count) else { // 1~6 일때만 진행
                print("잘못된 입력입니다.")
                continue
            }
            return input
        }
    }
}
