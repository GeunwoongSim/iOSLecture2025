// 사용자의 입력을 받아서 반환(안정성)

extension PhoneBook {
    func userInput() -> Int {
        print("Chice: ", terminator: "")
        guard let input: Int = Int(readLine() ?? ""), (input >= 1 && input <= 6) else {
            return 6
        }
        return input
    }
}
