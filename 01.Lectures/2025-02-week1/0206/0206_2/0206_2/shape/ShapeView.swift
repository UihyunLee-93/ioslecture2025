import Foundation


// 객체 배열 생성
var shapes: [Shape] = []//[Circle(), Rectangle()]

//배열 반복 출력
func showList(){
    for shape in shapes {
        shape.draw()
    }
}


for i in 1...5 {
    print("\(i)번째 타입선택 (1)Circle (2)Rectangle",terminator: ": ")
    let choice: Int = Int(readLine() ?? "0") ?? 0
    appendShape(int: choice)
    
}
func appendShape(int choice: Int){
    shapes.append(choice == 1 ? Circle() : Rectangle())
}
showList()

