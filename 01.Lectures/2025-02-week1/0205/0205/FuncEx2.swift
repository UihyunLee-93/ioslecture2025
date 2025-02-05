struct FunctionEx03 {
    
    init () {
        
        if let result = getName() {
            print("\(result)님 안녕하세요")
        } else {
            print("유효하지 않습니다.")
        }
    }
}
extension FunctionEx03 {
    func getName() -> String? {
        reutn nil
    }
}
