

class ShapeView {
    // Array 선언
    var shapeArr: [Shape]
    
    init() {
        shapeArr = [Circle(),Rectangle()]
    }
    
    func showList() {
        shapeArr.forEach{ $0.draw() }
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
    
    func main() {
        
        // 5회 반복 Shape 생성
        // 1번째 생성 할 객체 타입 선택 (1)Circle (2)Rectangle : 1
        // 리스트에 Circle 객체 추가 완료
        // 2번째 생성 할 객체 타입 선택 (1)Circle (2)Rectangle : 2
        // 리스트에 Rectangle 객체 추가 완료
        // 3번째 생성 할 객체 타입 선택 (1)Circle (2)Rectangle : 2
        
        for i in 1...5 {
            print("\(i)번째 생성 할 객체 타입 선택 (1)Circle (2)Rectangle : ", terminator: "")
            let choice: Int = Int(readLine() ?? "") ?? 1
            appendShape(choice)
        }
        
        showList()
    }
}
