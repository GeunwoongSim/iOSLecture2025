/*
 File: DeleteReflection.swift
 Purpose: 특정 날짜의 회고 내용을 삭제
 
 Data
 - date: String
 - deleteResult: Reflection? // 회고가 존재하지 않으면 nil
 
 etc
 - deleteResult의 경우 삭제한 회고에 대한 정보를 이용할만한게 있을까하여 남겨놓음
*/
extension ReflectionSystem {
    func deleteReflection() {
        guard let date = userDateInput(how: "삭제") else { return }
        guard let deleteResult = db.dbDelete(date: date) else {
            print("회고가 존재하지 않습니다.\n")
            return
        }
        print("회고가 삭제되었습니다.\n")
        // deleteResult에 접근하면 삭제한 정보를 받아올 수 있음
    }
}
