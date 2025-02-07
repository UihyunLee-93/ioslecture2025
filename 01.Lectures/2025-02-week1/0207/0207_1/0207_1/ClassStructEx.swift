class Person {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

struct Animal {
    var type: String
}




func changePersonName(){
    let person1 = Person(name: "Uihyun")
    let person2 = person1
    person2.name = "Lee"
    
    print(person1.name)
    
    
    var animal1 = Animal(type: "Dog")
    var animal2 = animal1
    animal2.type = "Cat"
    
    print(animal1.type)
}
