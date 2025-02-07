protocol Product {
    func displayInfo()
}

class Car: Product {
    var brand: String
    var model: String
    init(brand: String, model: String) {
        self.brand = brand
        self.model = model
    }
  
    func displayInfo() {
        print("브랜드 : \(brand) 모델 : \(model)")
        }
}

class Book: Product {
    var title: String
    var author: String
    
    init(title: String, author: String) {
        self.title = title
        self.author = author
    }

    func displayInfo() {
            print("제목 : \(title) 작가 : \(author)")
        }
}
