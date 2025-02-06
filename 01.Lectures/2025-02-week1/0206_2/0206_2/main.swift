import Foundation


// 객체 배열 생성
let shapes: [Shape] = [Circle(), Rectangle()]

//배열 반복 출력
for shape in shapes {
    shape.draw()
}

