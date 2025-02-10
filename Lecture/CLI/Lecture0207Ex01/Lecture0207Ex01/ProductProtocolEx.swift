
protocol Product {
    //내부 구현 용
    func info() // 추상메소드는 반드시 구현해줘야한다.
}
extension Product{
    // 외부 호출용
    func display() {
        info()
    }
}

class Car: Product {
    var brand: String
    var model: String
    // 필드의 초기화 함수
    init(_ brand: String, _ model: String) {
        self.brand = brand
        self.model = model
    }
    func info() {
        print(brand, model)
    }
}
class Book: Product {
    var title: String
    var author: String
    init(_ title: String, _ author: String) {
        self.title = title
        self.author = author
    }
    func info() {
        print(title, author)
    }
}

func ProductExRun() {
    let products: [Product] = [Car("aaa", "aaaModel"),Book("bbb", "bbbAuthor")]
//    products[0].display()
//    products[1].display()
    for product in products {
        product.display()
    }
}
