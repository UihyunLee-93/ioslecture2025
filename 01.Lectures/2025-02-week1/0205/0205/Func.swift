import Foundation

struct FunctionEx{
    
    func run(){
        
        print("run FunctionEx")
        
        func add(x : Int, y : Int) -> Int{
            return x + y
        }
        var a = add(x: 1,y: 10)
        print("\(a)")
    }
}
struct FunctionEx2{
    
    func run(){
        
        let userInfo = getUserInfo()
        print("입력받은 이름과 나이는 \(userInfo.name), \(userInfo.age) 입니다.")
    }
    func getUserInfo() ->(name: String, age: Int) {
        print("성명", terminator: ": ")
        let name = readLine() ?? ""
        print("나이", terminator: ": ")
        let age = Int(readLine() ?? "") ?? 0
        
        return(name,age)
    }
}

