//
//  main.swift
//  SwiftDay03Ex01
//
//  Created by Uihyun.Lee on 1/24/25.
//
import Foundation
//let sysNum = Int.random(in: 1...100)
//var count = 6
//
//print("1부터 100 사이의 숫자 기회는 6번~~")
//
//while count > 0 {
//    print("숫자를 입력하세요: ", terminator: "")
//    if let input = readLine(), let userNum = Int(input) {
//        if userNum == sysNum {
//            print("정답")
//            break
//        } else {
//            print(userNum < sysNum ? "업" : "다운")
//        }
//    }
//    count -= 1
//    if count == 0 {
//        print("기회를 모두 사용하셨습니다. 정답은 \(sysNum)였습니다.")
//    }
//}var yn: String
//repeat {
//    print("재시도 하겠습니까? (y/n): ", terminator: "")
//    yn = readLine() ?? ""
//} while yn != "y" && yn != "n"

import Foundation

//struct Reflection: Codable {
//    let date: String
//    var content: String
//}
//
//class ReflectionManager {
//    private var reflections: [String: Reflection] = [:]
//    private let filePath: String
//
//    init() {
//        let fileManager = FileManager.default
//        if let documentDirectory = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first {
//            filePath = documentDirectory.appendingPathComponent("reflections.json").path
//        } else {
//            filePath = ""
//        }
//
//        loadReflections()
//    }
//
//   
//    func addReflection(date: String, content: String) {
//        if !validateDate(date) {
//            print("올바른 날짜 형식을 입력하세요. (예: 2024-12-25)")
//            return
//        }
//        
//        if content.isEmpty {
//            print("회고 내용을 입력해야 합니다.")
//            return
//        }
//
//        reflections[date] = Reflection(date: date, content: content)
//        print("\(date)의 회고가 저장되었습니다.")
//    }
//
//
//    func getReflection(date: String) {
//        if let reflection = reflections[date] {
//            print("\n날짜: \(reflection.date)")
//            print("내용: \(reflection.content)\n")
//        } else {
//            print("해당 날짜의 회고를 찾을 수 없습니다.")
//        }
//    }
//
//
//    func updateReflection(date: String, newContent: String) {
//        if let _ = reflections[date] {
//            reflections[date]?.content = newContent
//            print("\(date)의 회고가 수정되었습니다.")
//        } else {
//            print("해당 날짜의 회고가 없습니다.")
//        }
//    }
//
//
//    func deleteReflection(date: String) {
//        if let _ = reflections.removeValue(forKey: date) {
//            print("\(date)의 회고가 삭제되었습니다.")
//        } else {
//            print("해당 날짜의 회고가 없습니다.")
//        }
//    }
//
//
//    func listAllReflections() {
//        if reflections.isEmpty {
//            print("저장된 회고가 없습니다.")
//        } else {
//            print("\n=== 전체 회고 목록 ===")
//            for (date, reflection) in reflections.sorted(by: { $0.key < $1.key }) {
//                print("날짜: \(date)")
//                print("내용: \(reflection.content)\n")
//                print("---------------------")
//            }
//        }
//    }
//
//
//
//    func saveReflections() {
//        do {
//            let data = try JSONEncoder().encode(reflections)
//            try data.write(to: URL(fileURLWithPath: filePath))
//            print("회고 데이터가 저장되었습니다.")
//        } catch {
//            print("데이터 저장 중 오류 발생: \(error)")
//        }
//    }
//
//
//    private func loadReflections() {
//        let fileURL = URL(fileURLWithPath: filePath)
//
//        if let data = try? Data(contentsOf: fileURL) {
//            if let loadedReflections = try? JSONDecoder().decode([String: Reflection].self, from: data) {
//                reflections = loadedReflections
//                print("기존 회고 데이터를 불러왔습니다.")
//            } else {
//                print("저장된 데이터를 불러오는 중 오류 발생")
//            }
//        } else {
//            print("새로운 회고 파일을 생성합니다.")
//        }
//    }
//
//    
//    private func validateDate(_ date: String) -> Bool {
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "yyyy-MM-dd"
//        return dateFormatter.date(from: date) != nil
//    }
//}
//
//
//func mainMenu() {
//    let manager = ReflectionManager()
//
//    while true {
//        print("""
//        \n=== 회고 시스템 ===
//        1. 회고 추가
//        2. 회고 조회
//        3. 회고 수정
//        4. 회고 삭제
//        5. 전체 회고 목록 출력
//        6. 종료
//        """)
//        
//        print("메뉴를 선택하세요:", terminator: " ")
//        if let choice = readLine(), let option = Int(choice) {
//            if option == 0 {
//                print("메뉴에서 나갑니다.")
//                continue
//            }
//            switch option {
//            case 1:
//                print("날짜를 입력하세요 (예: 2025-01-01, 0 입력 시 메인메뉴로 이동):", terminator: " ")
//                let date = readLine() ?? ""
//                if date == "0" { continue }
//                
//                print("회고 내용을 입력하세요 (0 입력 시 메인메뉴로 이동):")
//                let content = readLine() ?? ""
//                if content == "0" { continue }
//
//                manager.addReflection(date: date, content: content)
//
//            case 2:
//                print("조회할 날짜를 입력하세요 (0 입력 시 메인메뉴로 이동):", terminator: " ")
//                let date = readLine() ?? ""
//                if date == "0" { continue }
//                
//                manager.getReflection(date: date)
//
//            case 3:
//                print("수정할 날짜를 입력하세요 (0 입력 시 메인메뉴로 이동):", terminator: " ")
//                let date = readLine() ?? ""
//                if date == "0" { continue }
//                
//                print("새로운 회고 내용을 입력하세요 (0 입력 시 메인메뉴로 이동):")
//                let newContent = readLine() ?? ""
//                if newContent == "0" { continue }
//                
//                manager.updateReflection(date: date, newContent: newContent)
//
//            case 4:
//                print("삭제할 날짜를 입력하세요 (0 입력 시 메인메뉴로 이동):", terminator: " ")
//                let date = readLine() ?? ""
//                if date == "0" { continue }
//
//                manager.deleteReflection(date: date)
//
//            case 5:
//                manager.listAllReflections()
//
//            case 6:
//                print("프로그램을 종료합니다.")
//                manager.saveReflections()
//                return
//
//            default:
//                print("잘못된 메뉴 선택입니다.")
//            }
//        } else {
//            print("숫자를 입력하세요.")
//        }
//    }
//
//    }
//
//
//// 프로그램 실행
//mainMenu()
//
var total = 0
var num = 1

let end = 10

while num <= end {
    if num % 2 == 0 {
        print(num, terminator: num < end ? "-" : "=")
        total -= num
    } else {
        total += num
        print(num, terminator: num < end ? "+" : "=")
    }
    num += 1
}
print(total)
