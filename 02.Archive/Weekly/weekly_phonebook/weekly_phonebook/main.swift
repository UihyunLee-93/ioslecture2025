import Foundation

let phoneBookManager = PhoneBookManager()

func main() {
    while true {
        phoneBookManager.menu()
        print("번호를 선택하세요:", terminator: " ")
        
        if let choice = readLine(), let option = Int(choice) {
            phoneBookManager.menuSelection(option) 
        } else {
            print(" 잘못된 입력입니다. 숫자를 입력하세요.")
        }
    }
}

main()
