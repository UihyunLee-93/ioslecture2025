import Foundation

// 부모 클래스 (Shape)
class Shape {
    func draw() {
        print("도형을 그립니다.")
    }
}

class ShapeView{
    
}

// 자식 클래스 원
class Circle: Shape {
    override func draw() {
        print("원을 그립니다.")
    }
}

// 자식 클래스 사각형
class Rectangle: Shape {
    override func draw() {
        print("사각형을 그립니다.")
    }
}


