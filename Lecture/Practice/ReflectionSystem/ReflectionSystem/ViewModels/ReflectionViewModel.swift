import SwiftUI


class ReflectionViewModel: ObservableObject {
    @Published var reflections: [Reflection] = []
    
    func reflectionsSave(){
        guard let directory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {
            return
        }
        let fileurl = directory.appendingPathComponent("reflections.json")
        
        guard let data = try? JSONEncoder().encode(reflections) else {
            return
        }
        do{
            try data.write(to: fileurl)
        } catch {
            print("파일 작성 실패")
        }
        print(reflections)
    }
    
    func reflectionsLoad(){
        guard let directory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {
            print("디렉토리 못찾음")
            return
        }
        let fileurl = directory.appendingPathComponent("reflections.json")
        guard let data = try? Data(contentsOf: fileurl) else {
            print("url에서 데이터로 못바꿈")
            return
        }
        guard let json = try? JSONDecoder().decode([Reflection].self, from: data) else{
            print("데이터로 값 대입 못시킴")
            return
        }
        reflections = json
        
    }
}
