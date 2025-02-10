// Super class (조상 클래스)
class Shape {
    
    init() { }
    func draw() {
        print("도형을 그립니다.")
    }
}

// Shape를 확장한 Circle과 Rectangle 클래스를 만들고
// draw() 메서드를 오버라이드 하세요.

class Circle: Shape{
    override func draw() {
        print("Circle을 그립니다.")
    }
}
class Rectangle: Shape{
    override func draw() {
        print("Rectangle을 그립니다.")
    }
}

