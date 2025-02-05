//
//  main.swift
//  0205_2
//
//  Created by Uihyun.Lee on 2/5/25.
//

import Foundation


var phoneBook: [String: String] = [:]
let phoneBookManager = PhoneBookManager()
func main() {
    while true {
        phoneBookManager.menu()
        print("번호를 선택하세요:", terminator: " ")
        if let choice = readLine(), let option = Int(choice) {
            switch option {
            case 1: phoneBookManager.input()
            case 2: phoneBookManager.output()
            case 3: phoneBookManager.search()
            case 4: phoneBookManager.edit()
            case 5: phoneBookManager.delete()
            case 6: 
                print("프로그램을 종료합니다.")
                exit(0)
                return
            default:
                print("올바른 번호를 입력하세요.")
            }
        } else {
            print("잘못된 입력입니다. 숫자를 입력하세요.")
        }
    }
}


main()

