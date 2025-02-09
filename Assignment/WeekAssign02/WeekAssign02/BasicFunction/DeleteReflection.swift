/*
 File: DeleteReflection.swift
 Purpose: 특정 날짜의 회고 내용을 삭제
 
 Input Data
 - 파일에서 처리하는 기능에 대한 입력, 전달 값
 Output Data
 - 파일에서 처리한 내용에 대한 출력, 반환 값
 
 Warning
 -
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
