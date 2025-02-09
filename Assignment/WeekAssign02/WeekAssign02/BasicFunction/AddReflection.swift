/*
 File: AddReflection.swift
 Purpose: 특정 날짜에 회고 내용을 추가
 
 Data (사용하는 자료)
 - date: String
 - reflection: Reflection
 - searchResult: Reflection? // 회고가 존재하지 않으면 nil

 etc
 - searchResult의 경우 추가한 회고에 대한 정보를 이용할만한게 있을까하여 남겨놓음
*/
extension ReflectionSystem {
    func addReflection() {
        // 날짜를 입력
        guard let date = userDateInput(how: "추가") else { return }
        // 입력 받은 날짜에 회고가 없는지 확인
        guard let searchResult = db.dbSearch(date: date) else {
            // 입력 받은 날짜에 회고가 없음
            guard let content = userContentInput() else { return }
            let reflection = Reflection(date: date, content: content)
            if db.dbInsert(date: date, content: reflection) {
                print("회고가 추가되었습니다.\n")
            }else {
                print("회고를 추가하지 못했습니다. 잠시후 다시 시도해주세요.\n")
            }
            return
        }
        // searchResult에 접근하면 이미 존재하는 정보를 받아올 수 있음
        print("회고가 이미 존재합니다.\n")
    }
    
}
