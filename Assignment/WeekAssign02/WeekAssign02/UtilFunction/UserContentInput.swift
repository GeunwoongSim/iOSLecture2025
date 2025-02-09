/*
 File: UserContentInput.swift
 Purpose: 해당 파일의 목적
 
 Input Data
 - 파일에서 처리하는 기능에 대한 입력, 전달 값
 Output Data
 - 파일에서 처리한 내용에 대한 출력, 반환 값
 
 Warning
 -
*/

extension ReflectionSystem {
    func userContentInput() -> String? {
        print("회고 내용을 입력하세요: ", terminator: "")
        guard let content = readLine() else {
            print("잘못된 입력입니다.")
            return nil
        }
        if content == "" {
            print("작성된 내용이 없습니다.\n")
            return nil
        }
        
        return content
    }
}
