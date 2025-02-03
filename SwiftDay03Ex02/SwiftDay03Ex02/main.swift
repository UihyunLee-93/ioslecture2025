//
//  main.swift
//  SwiftDay03Ex02
//
//  Created by Uihyun.Lee on 1/24/25.
//

//import Foundation
//
//print("Hello, World!")
//
//let month
//var total: Int = 0
//
//for i in monthDays {
//    total += i
//}
//print("1년은 \(total)일 입니다.")
import Foundation
// 1번 문제
let monthDays = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

print("월 입력: ", terminator: "")
var month = Int(readLine() ?? "") ?? 0

print("일 입력: ", terminator: "")
var day = Int(readLine() ?? "") ?? 0

if month < 1 || month > 12 || day < 1 || day > monthDays[month - 1] {
    print("잘못된 날짜입니다.")
} else {
    var totalDays = 0
    var i = 0
    while i < month - 1 {
        totalDays += monthDays[i]
        i += 1
    }
    totalDays += day
    print("1월 1일부터 \(month)월 \(day)일까지의 누적일은 \(totalDays)일입니다.")
}

// 2번문제
print("\n월 입력 : ", terminator: "")
var startMonth = Int(readLine() ?? "") ?? 0

print("일 입력 : ", terminator: "")
var startDay = Int(readLine() ?? "") ?? 0

if startMonth < 1 || startMonth > 12 || startDay < 1 || startDay > monthDays[startMonth - 1] {
    print("잘못된 날짜입니다.")
} else {
    var daysLeft = 100
    var currentMonth = startMonth
    var currentDay = startDay

    while daysLeft > 0 {
        let daysInMonth = monthDays[currentMonth - 1]

        if currentDay + daysLeft <= daysInMonth {
            currentDay += daysLeft
            daysLeft = 0
        } else {
            daysLeft -= (daysInMonth - currentDay + 1)
            currentMonth += 1
            currentDay = 1

            if currentMonth > 12 {
                currentMonth = 1
            }
        }
    }

    print("\(startMonth)월 \(startDay)일의 100일 후는 \(currentMonth)월 \(currentDay)일입니다.")
}
