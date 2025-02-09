/*
 File: PrintAllReflection.swift
 Purpose: 날짜별 회고 목록을 출력
 
 Input Data
 - 파일에서 처리하는 기능에 대한 입력, 전달 값
 Output Data
 - 파일에서 처리한 내용에 대한 출력, 반환 값
 
 Warning
 -
*/
/*
 File: PrintAllReflection.swift
 Purpose: 저장된 모든 회고를 출력
 
 Data
 - reflections: Reflection // db에 저장된 회고목록을 전부 불러옴, 없으면 nil이 아닌 []이 반환

 etc
 - 보여주기 식으로 print가 많을뿐..
 - 나중에 UI로 다시 짜봐도 괜찮을듯?
*/
extension ReflectionSystem {
    func printAllReflection() {
        let reflections: [Reflection] = db.dbSearchAll()
        print("=== 저장된 회고 목록 ===")
        if reflections.isEmpty { print("저장된 회고가 없습니다.") }
        else {
            for (idx, reflection) in reflections.enumerated() {
                print("날짜: \(reflection.date)")
                print("내용: \(reflection.content)")
                if idx != reflections.count - 1 {
                    print("--------------------")
                }
            }
        }
        print("====================\n")
    }
}
