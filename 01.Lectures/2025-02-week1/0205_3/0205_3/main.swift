//
//  main.swift
//  0205_3
//
//  Created by Uihyun.Lee on 2/5/25.
//

import Foundation

//func myFunc(){
//    print ("호출 myFunc")
//}
//myFunc()
//
//var refFunc = myFunc


//클로저

//func mult (a: Int, b: Int)->Int{
//    return a*b
//}
//let multiply = {(a: Int,b: Int)->Int in a * b}
//print(multiply(10,20))

let numbers: [Int] = [4,5,2,1,3]

let newNumbers: [Int] = numbers.map{ $0 * 2}
print(newNumbers)
    
let sortedArr: [Int] = numbers.sorted{ $0 < $1 }
print(sortedArr)
