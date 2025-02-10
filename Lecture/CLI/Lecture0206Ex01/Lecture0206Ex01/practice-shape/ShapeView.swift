

class ShapeView {
    // Array 선언
    var shapeArr: [Shape]
    var _factory: [()->Void] = []
    
    init() {
        shapeArr = [Circle(),Rectangle()]
        _factory = [inputShape,showList,end]
    }
    
    func end() {
        print("프로세스를 종료합니다.")
    }
    
    func showList() {
        shapeArr.forEach{ $0.draw() }
    }
    func showList(_ shapeArr: [Shape]) {
        shapeArr.forEach{ $0.draw() }
    }
    
    func inputShape() {
        print("[1]Circle, [2]Rectangle")
        print("선택 : ", terminator: "")
        guard let choice = readLine(), let intChoice = Int(choice) else {
            print("잘못 입력하셨습니다.")
            return
        }
        appendShape(intChoice)
    }
    
    func appendShape(_ choice: Int) {
        if choice == 1 {
            self.shapeArr.append(Circle())
            print("리스트에 Circle 객체 추가 완료")
        }else if choice == 2 {
            self.shapeArr.append(Rectangle())
            print("리스트에 Rectangle 객체 추가 완료")
        }
    }
    func newAppendShape(_ choice: Int, newShapeList: [Shape]) -> [Shape] {
        // 함수형 프로그래밍 방식
        var newList: [Shape] = []
        if choice == 1 {
            newList.append(Circle())
            print("리스트에 Circle 객체 추가 완료")
        }else if choice == 2 {
            newList.append(Rectangle())
            print("리스트에 Rectangle 객체 추가 완료")
        }
        
        return newShapeList.count == 0 ? shapeArr + newShapeList + newList : newShapeList + newList
    }
    
    func main() {
        // 5회 반복 Shape 생성
        // 1번째 생성 할 객체 타입 선택 (1)Circle (2)Rectangle : 1
        // 리스트에 Circle 객체 추가 완료
        // 2번째 생성 할 객체 타입 선택 (1)Circle (2)Rectangle : 2
        // 리스트에 Rectangle 객체 추가 완료
        // 3번째 생성 할 객체 타입 선택 (1)Circle (2)Rectangle : 2
        
//        for i in 1...5 {
//            print("\(i)번째 생성 할 객체 타입 선택 (1)Circle (2)Rectangle : ", terminator: "")
//            let choice: Int = Int(readLine() ?? "") ?? 1
//            appendShape(choice)
//        }
        
//        var list: [Shape] = []
//        for i in 1...5 {
//            print("\(i)번째 생성 할 객체 타입 선택 (1)Circle (2)Rectangle : ", terminator: "")
//            let choice: Int = Int(readLine() ?? "") ?? 1
//            list = newAppendShape(choice, newShapeList: list)
//        }
//        showList()
//        showList(list)
        
        // [1]입력 [2]목록 [3]종료
        // 선택: 1
        // [1]Circle [2]Rectangle
        // 선택: 2
        // Rectangle 추가 완료!
        // --------------------
        // [1]입력 [2]목록 [3]종료
        
        while true {
            print("[1]입력 [2]목록 [3]종료")
            print("선택: ", terminator: "")
            let no = Int(readLine() ?? "") ?? 0
            
            _factory[no-1]()
//            
//            if no == 1 { inputShape() }
//            if no == 2 { showList() }
            if no == 3 {
                break
            }
        }
        
        
    }
}
