//
//  Car.swift
//  0206
//
//  Created by Uihyun.Lee on 2/6/25.
//


import Foundation

class Car {
    var color: String
    var speed: Int
    
    init(color: String, speed: Int) {
        self.color = color
        self.speed = speed
    }
    
    func drive(){
        print("\(color) car is driving at \(speed) km/h")
    }
}
