//
//  main.swift
//  Swift0204
//
//  Created by Uihyun.Lee on 2/4/25.
//

import Foundation

let exma = Example()

var monthDays = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

print("월을 입력하세요:", terminator: " ")
let month = Int(readLine()!) ?? 1
print("일을 입력하세요:", terminator: " ")
let day = Int(readLine()!) ?? 1
print("원하는 일수를 입력해주세요:", terminator: " ")
let afterday = Int(readLine()!) ?? 1



// MARK: 날짜 계산
var nextDay = day
var nextMonth = month
var remainDays = afterday
var curMonth = month

if day + remainDays <= monthDays[month - 1] { // 해당달에 처리가능한경우
    nextDay += remainDays
} else {
    remainDays -= (monthDays[month - 1] - day + 1)
    curMonth += 1
    nextDay = 1

    while remainDays > 0 {
                if remainDays >= monthDays[curMonth - 1] {
            remainDays -= monthDays[curMonth - 1]
            curMonth += 1
        } else {
            nextDay = remainDays + 1
            remainDays = 0
        }
    }
    nextMonth = curMonth
}
print("\(month)월 \(day)일의 \(afterday)일 후는 \(nextMonth)월 \(nextDay)일입니다.")
