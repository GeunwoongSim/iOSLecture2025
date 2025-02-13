
import Foundation
import SwiftUI

struct User: Codable, Identifiable {
    var id: UUID
    var name: String
    var age: Int
}

class FileManagerHelper {
    static let shared: FileManagerHelper = FileManagerHelper()
    private let fileName = "users.json"
    
    func saveUser(_ users: [User]) {
        // 디렉토리생성 -> 파일명 붙여줌 -> 객체를 data로 변경(encode) -> 파일 작성(write)
        guard let documentDirecotry = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {
            print("디렉토리가 없음")
            return
        }
        let fileURL = documentDirecotry.appendingPathComponent(fileName)
        print(fileURL) // 해당 URL을 크롬에 붙여넣으면 파일 확인 가능
        guard let data = try? JSONEncoder().encode(users) else {
            print("JSON으로 변경 실패")
            return
        }
        do{
            try data.write(to: fileURL)
        }catch {
            print("파일 작성 실패")
        }
    }
    
    func loadUser() -> [User] {
        // 디렉토리생성 -> 파일명 붙여줌 -> 파일을 data로 받아옴 -> data를 객체로 변경(Decode)
        // 디렉토리 경로를 가져옴
        guard let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {
            print("디렉토리가 없음")
            return []
        }
        let fileURL = documentDirectory.appendingPathComponent(fileName) //  파일 경로 생성
        
        // 파일 -> 데이터 -> JSON 데이터를 [User]형태로 바꿈
        guard let data = try? Data(contentsOf: fileURL), let users = try? JSONDecoder().decode([User].self, from: data) else {
            print("파일을 읽어올 수 없음")
            return []
        }
        return users
    }
}
