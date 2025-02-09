/*
 File: EditReflection.swift
 Purpose: 특정 날짜의 회고 내용을 수정
 
 Input Data
 - 파일에서 처리하는 기능에 대한 입력, 전달 값
 Output Data
 - 파일에서 처리한 내용에 대한 출력, 반환 값
 
 Warning
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
