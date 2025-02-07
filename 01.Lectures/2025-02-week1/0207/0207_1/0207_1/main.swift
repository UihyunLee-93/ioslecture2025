//
//  main.swift
//  0207_1
//
//  Created by Uihyun.Lee on 2/7/25.
//
import Foundation

var productList: [Product] = [Car(brand: "현대", model: "소나타"), Book(title: "일기", author: "김이박")]
for product in productList {
    product.displayInfo()
}
