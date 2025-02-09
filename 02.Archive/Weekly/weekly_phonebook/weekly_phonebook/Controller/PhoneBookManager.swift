import Foundation

class PhoneBookManager {
    private var phoneBook: [String: ContactInfo] = [:]

    func run() {
        while true {
            menu()
            print("번호를 선택하세요:", terminator: " ")
            
            if let choice = readLine(), let option = Int(choice) {
                menuSelection(option)
            } else {
                print(" 잘못된 입력입니다. 숫자를 입력하세요.")
            }
        }
    }
    func menu() {
        print("\n:::::::::::: 전화번호부 :::::::::::::")
        print("1) 추가  2) 출력  3) 검색  4) 수정  5) 삭제  6) 종료")
    }
    func menuSelection(_ option: Int) {
            switch option {
            case 1: input()
            case 2: output()
            case 3: search()
            case 4: edit()
            case 5: delete()
            case 6:
                print(" 프로그램을 종료합니다.")
                exit(0)
            default:
                print(" 올바른 번호를 입력하세요.")
            }
        }

    func input() {
        print("이름을 입력하세요:", terminator: " ")
        if let name = readLine(), !name.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            print("전화번호를 입력하세요:", terminator: " ")
            if let phoneNumber = readLine(), !phoneNumber.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                let contact = ContactInfo(name: name, phoneNumber: phoneNumber)
                phoneBook[name] = contact
                print("\(name)의 전화번호가 저장되었습니다.")
            } else {
                print(" 올바른 전화번호를 입력하세요.")
            }
        } else {
            print(" 올바른 이름을 입력하세요.")
        }
    }

    func output() {
        print("\n:::::::::::: 전화번호부 :::::::::::::")
        if phoneBook.isEmpty {
            print(" 전화번호부가 비어있습니다.")
        } else {
            for contact in phoneBook.values.sorted(by: { $0.name < $1.name }) {
                contact.printContactInfo()
            }
        }
    }

    func search() {
        print("검색할 이름을 입력하세요:", terminator: " ")
        if let name = readLine(), let contact = phoneBook[name] {
            contact.printContactInfo()
        } else {
            print("해당 이름이 등록되어 있지 않습니다.")
        }
    }

    func edit() {
        print("수정할 전화번호의 이름을 입력해주세요:", terminator: " ")
        if let name = readLine(), let contact = phoneBook[name] {
            print("새로운 전화번호를 입력하세요:", terminator: " ")
            if let newPhone = readLine(), !newPhone.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                contact.phoneNumber = newPhone
                print("\(name)의 전화번호가 \(newPhone) 으로 수정되었습니다.")
            } else {
                print("올바른 전화번호를 입력하세요.")
            }
        } else {
            print("해당 연락처가 존재하지 않습니다.")
        }
    }

    func delete() {
        print("삭제할 번호의 이름을 입력하세요:", terminator: " ")
        if let name = readLine(), phoneBook.removeValue(forKey: name) != nil {
            print(" \(name)의 연락처가 삭제되었습니다.")
        } else {
            print(" 해당 연락처를 찾을 수 없습니다.")
        }
    }
}
