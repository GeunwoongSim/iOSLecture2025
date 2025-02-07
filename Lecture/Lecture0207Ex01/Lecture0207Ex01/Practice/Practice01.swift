
class Person {
    var name: String
    init(name: String) {
        self.name = name
    }
}

struct Animal {
    var type: String
}

func Practice01() {
    let person1 = Person(name: "Alice")
    let person2 = person1
    person2.name = "Bob"

    print(person1.name)

    var animal1 = Animal(type: "Cat")
    var animal2 = animal1
    animal2.type = "Dog"

    print(animal1.type)
}

