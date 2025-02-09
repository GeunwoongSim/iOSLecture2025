/*
 File: UserContentInput.swift
 Purpose: 회고의 내용을 입력했을때 이상한 입력인지 판단하고 빈 값인지 확인
 
 Data
 - content: String // content가 nil이거나 ""이면 nil을 반환, 아니면 정상적인 content를 반환

 etc
 - 지금 대부분 guard 구문으로 nil을 반환하고 끝나는데 이 부분들을 에러로 해서 throw Error처리 해보고 싶다
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
