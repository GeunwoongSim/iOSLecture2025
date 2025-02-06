

import Foundation

//let sonata = Car(color: "검정색", speed: 110)
//let grandeur = Car(color: "하얀색", speed: 120)
//
//let carlist: [Car] = [sonata,grandeur]
//let carlist2: [Car] = [Car(color: "보라색", speed: 90),Car(color: "파란색", speed: 130)]

class Shape {
    func draw() {
        print("도형을 그립니다.")
    }
}
class Circle: Shape{
    override func draw() {
        print("원을 그립니다.")
    }
}
class Rectangle: Shape{
    override func draw() {
        print("사각형을 그립니다.")
    }
}


let shapeArr: [Shape] = [Circle(),Rectangle()]
for shape in shapeArr {
    shape.draw()
}

