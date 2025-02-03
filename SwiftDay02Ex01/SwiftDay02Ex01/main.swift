//
//  main.swift
//  SwiftDay02Ex01
//
//  Created by Uihyun.Lee on 1/23/25.
//
// 한줄주석입니다.
/*
 여러줄 주석입니다.
 /*
  중첩주석입니다.
  */
 */
import Foundation
//print("이름을 입력해주세요 : ",terminator: "")
//let inputname: String = readLine() ?? ""
//print("나이를 입력해주세요 : ",terminator: "")
//var inputage: Int = Int(readLine() ?? "0") ?? 0
//
//print ("\(inputname)님의 5년후의 나이는 \(inputage+5)살입니다.")
//
//var name: String? = nil
//
//name = "Uihyun"
//let userName = name ?? "Anonymous"
//print(userName)



//print("첫 번째 숫자를 입력하세요:")
//let input1 = readLine()
//print("두 번째 숫자를 입력하세요:")
//let input2 = readLine()
//print("세 번째 숫자를 입력하세요:")
//let input3 = readLine()
//
//if let num1 = Int(input1 ?? ""), let num2 = Int(input2 ?? ""), let num3 = Int(input3 ?? "") {
//    var largest = num1
//    var middle = num1
//    var smallest = num1
//
//    if num2 > largest {
//        largest = num2
//    }
//    if num3 > largest {
//        largest = num3
//    }
//
//    if (num1 < num2 && num1 > num3) || (num1 > num2 && num1 < num3) {
//        middle = num1
//    } else if (num2 < num1 && num2 > num3) || (num2 > num1 && num2 < num3) {
//        middle = num2
//    } else {
//        middle = num3
//    }
//
//    smallest = num1 + num2 + num3 - largest - middle
//
//    print("큰 수: \(largest)")
//    print("중간 수: \(middle)")
//    print("작은 수: \(smallest)")
//} else {
//    print("숫자를 정확히 입력하세요.")
//}

//if var inputGrade = Int(readLine() ?? <#default value#>) != nil
//
//switch inputGrade {
//case 90...100:
//    print("A")
//case 80..<90:
//    print("B")
//case 70..<80:
//    print("C")
//case 60..<70:
//    print("D")
//default:
//    print("F")
//let size = 10
//var total: Int = 0
//
//for num in 1...size {
//    print("\(num)", terminator: num < 10 ? " + " : " = ")
//        total += num
//}
//
//print("1부터 \(size)까지의 합은 \(total)입니다.")
//    
let size = 10
var total: Int = 0

for num in 1...size {
    if num < size {
        print("\(num) + ", terminator: "")
    } else {
        print("\(num) = ", terminator: "")
    }
    total += num
}
print(total)


