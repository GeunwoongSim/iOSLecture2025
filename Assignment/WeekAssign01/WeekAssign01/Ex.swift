//import Foundation
//
//// MARK: - Reflection 구조체
//struct Reflection: Codable {
//    let date: String
//    var content: String
//}
//
//// MARK: - ReflectionManager 클래스
//class ReflectionManager {
//    private var reflections: [String: Reflection] = [:]
//    private let filePath: String
//
//    // 생성자: 파일 경로 설정 및 파일 데이터 로드
//    init() {
//        let fileManager = FileManager.default
//        let documentDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first!
//        filePath = documentDirectory.appendingPathComponent("reflections.json").path
//
//        loadReflections()
//    }
//
//    // 회고 추가
//    func addReflection(date: String, content: String) {
//        guard validateDate(date) else {
//            print("잘못된 날짜 형식입니다. (예: 2024-12-25)")
//            return
//        }
//        guard !content.isEmpty else {
//            print("회고 내용이 비어있습니다.")
//            return
//        }
//
//        let reflection = Reflection(date: date, content: content)
//        reflections[date] = reflection
//        print("회고가 추가되었습니다.")
//    }
//
//    // 회고 조회
//    func getReflection(date: String) {
//        if let reflection = reflections[date] {
//            print("날짜: \(reflection.date)")
//            print("내용: \(reflection.content)")
//        } else {
//            print("해당 날짜의 회고가 없습니다.")
//        }
//    }
//
//    // 회고 수정
//    func updateReflection(date: String, newContent: String) {
//        if reflections[date] != nil {
//            reflections[date]?.content = newContent
//            print("회고가 수정되었습니다.")
//        } else {
//            print("해당 날짜의 회고가 없습니다.")
//        }
//    }
//
//    // 회고 삭제
//    func deleteReflection(date: String) {
//        if reflections.removeValue(forKey: date) != nil {
//            print("회고가 삭제되었습니다.")
//        } else {
//            print("해당 날짜의 회고가 없습니다.")
//        }
//    }
//
//    // 모든 회고 출력
//    func listAllReflections() {
//        if reflections.isEmpty {
//            print("저장된 회고가 없습니다.")
//        } else {
//            for (date, reflection) in reflections.sorted(by: { $0.key < $1.key }) {
//                print("날짜: \(date)")
//                print("내용: \(reflection.content)\n")
//            }
//        }
//    }
//
//    // MARK: - 파일 저장 및 로드 기능
//
//    // 회고 데이터를 파일에 저장
//    func saveReflections() {
//        do {
//            let data = try JSONEncoder().encode(reflections)
//            try data.write(to: URL(fileURLWithPath: filePath))
//            print("데이터가 성공적으로 저장되었습니다.")
//        } catch {
//            print("데이터 저장 실패: \(error)")
//        }
//    }
//
//    // 파일에서 회고 데이터를 로드
//    private func loadReflections() {
//        do {
//            let data = try Data(contentsOf: URL(fileURLWithPath: filePath))
//            reflections = try JSONDecoder().decode([String: Reflection].self, from: data)
//            print("데이터가 성공적으로 로드되었습니다.")
//        } catch {
//            print("새로운 회고 파일을 생성합니다.")
//        }
//    }
//
//    // MARK: - 날짜 검증 함수
//
//    // 날짜 형식 검증 (예: 2024-12-25)
//    private func validateDate(_ date: String) -> Bool {
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "yyyy-MM-dd"
//        return dateFormatter.date(from: date) != nil
//    }
//}
//
//// MARK: - CLI 메뉴 시스템
//func mainMenu() {
//    let manager = ReflectionManager()
//
//    while true {
//        print("""
//        === 회고 시스템 ===
//        1. 회고 추가
//        2. 회고 조회
//        3. 회고 수정
//        4. 회고 삭제
//        5. 전체 회고 목록 출력
//        6. 종료
//        """)
//
//        print("메뉴를 선택하세요:", terminator: " ")
//        guard let choice = readLine(), let option = Int(choice) else {
//            print("잘못된 입력입니다.")
//            continue
//        }
//
//        switch option {
//        case 1:
//            print("날짜를 입력하세요 (예: 2024-12-25):", terminator: " ")
//            let date = readLine() ?? ""
//            print("회고 내용을 입력하세요:")
//            let content = readLine() ?? ""
//            manager.addReflection(date: date, content: content)
//
//        case 2:
//            print("조회할 날짜를 입력하세요:", terminator: " ")
//            let date = readLine() ?? ""
//            manager.getReflection(date: date)
//
//        case 3:
//            print("수정할 날짜를 입력하세요:", terminator: " ")
//            let date = readLine() ?? ""
//            print("새로운 회고 내용을 입력하세요:")
//            let newContent = readLine() ?? ""
//            manager.updateReflection(date: date, newContent: newContent)
//
//        case 4:
//            print("삭제할 날짜를 입력하세요:", terminator: " ")
//            let date = readLine() ?? ""
//            manager.deleteReflection(date: date)
//
//        case 5:
//            manager.listAllReflections()
//
//        case 6:
//            print("프로그램을 종료합니다.")
//            manager.saveReflections()
//            return
//
//        default:
//            print("잘못된 메뉴 선택입니다.")
//        }
//    }
//}
//
//
