




class Car {
    //멤버 필드 선언
    var color: String
    var speed: Int
    
    // 초기화 함수 (생성자)
    init(color: String, speed: Int){
        // 필드 = 매개변수
        self.color = color
        self.speed = speed
    }
    // 멤버 메서드 함수 = 객체 외부에서 접근
    func drive() {
        print("\(color) 자동차가 \(speed)km/h로 주행합니다.")
    }
    
}
func carRun(){
    let sonata = Car(color: "검정색", speed: 110)
    let grandeur = Car(color: "하얀색", speed: 120)
    
    let carlist: [Car] = [sonata,grandeur]
    let carlist2: [Car] = [Car(color: "보라색", speed: 90),Car(color: "파란색", speed: 130)]
}
