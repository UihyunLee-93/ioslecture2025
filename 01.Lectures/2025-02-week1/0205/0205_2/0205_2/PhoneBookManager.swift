struct PhoneBookManager {
    
    
    func menu() {
        print("\n:::::::::::: 전화번호부 :::::::::::::")
        print("1) Input  2) Output  3) Search  4) Edit  5) Delete  6) End")
    }
    func input() {
        print("이름을 입력하세요:",terminator: " ")
        if let name = readLine(), !name.isEmpty {
            print("전화번호를 입력하세요:",terminator: " ")
            if let phoneNumber = readLine(), !phoneNumber.isEmpty {
                phoneBook[name] = phoneNumber
            } else {
                print("잘못입력하셨습니다.")
            }
        } else {
            print("잘못입력하셨습니다.")
            
        }
        
    }
    func output() {
        print("\n:::::::::::: 전화번호부 :::::::::::::")
        if phoneBook.isEmpty {
            print("전화번호부가 비어있습니다.")
        } else {
            for(name, phoneNumber) in phoneBook {
                print("\(name): \(phoneNumber)")
            }
        }
    }
    func search() {
        print("검색할 이름을 입력하세요")
        if let name = readLine(), let phone = phoneBook[name]{
            print("\(name)의 전화번호는 \(phone) 입니다.")
        } else {
            print("등록되어있지 않습니다.")
        }
        
    }
    func edit() {
        print("수정할 전화번호의 이름을 입력해주세요:",terminator: " ")
        if let name = readLine(), let beforePhone = phoneBook[name] {
            print("새로운 전화번호를 입력하세요:", terminator: " ")
            if let newPhone = readLine(), !newPhone.isEmpty {
                phoneBook[name] = newPhone
                print("\(name)의 번호가 수정되었습니다.")
            } else {
                print("전화번호를 입력하세요.")
            }
        } else {
            print("저장된 연락처가 없습니다.")
        }
    }
    
    func delete() {
        print("삭제할 번호의 이름을 입력하세요:", terminator: " ")
        if let name = readLine(), phoneBook.removeValue(forKey: name) != nil {
            print("\(name)의 연락처가 삭제되었습니다.")
        } else {
            print("연락처를 찾을 수 없습니다.")
        }
    }
    
}
