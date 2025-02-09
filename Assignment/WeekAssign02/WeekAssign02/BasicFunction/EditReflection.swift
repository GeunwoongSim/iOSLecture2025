/*
 File: EditReflection.swift
 Purpose: 특정 날짜의 회고 내용을 수정
   
 Data
 - date: String
 - searchResult: Reflection? // 회고가 존재하지 않으면 nil
 
 etc
 - 
 */
extension ReflectionSystem {
    func editReflection() {
        guard let date = userDateInput(how: "수정") else { return }
        guard let searchResult = db.dbSearch(date: date) else {
            print("회고가 존재하지 않습니다.\n")
            return
        }
        print("====수정전 회고 내용=====")
        print("내용: \(searchResult.content)")
        print("=====================")
        guard let content = userContentInput() else { return }
        let reflection = Reflection(date: date, content: content)
        if db.dbInsert(date: date, content: reflection) {
            print("회고가 수정되었습니다.\n")
        }else {
            print("회고를 추가하지 못했습니다. 잠시후 다시 시도해주세요.\n")
        }
    }
}
