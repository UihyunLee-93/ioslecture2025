//
//  JSONtoDictionary.swift
//  0211_SwiftUIEx01
//
//  Created by Uihyun.Lee on 2/11/25.
//

import SwiftUI
struct Product: Decodable {
    let name: String
    let imageName: String
    let price: Int
    let description: String
    let isFavorite: Bool
}


let jsonString = """
[
  {
    "name": "나는야 무화과",
    "imageName": "fig",
    "price": 3100,
    "description": "소화가 잘되고 변비에 좋은 달달한 국내산 무화과에요. 고기와 찰떡궁합!",
    "isFavorite": false
  },
  {
    "name": "유기농 아보카도",
    "imageName": "avocado",
    "price": 2900,
    "description": "미네랄도 풍부하고, 요리 장식과 소스로도 좋은 아보카도입니다",
    "isFavorite": false
  },
  {
    "name": "바나나 안 바나나",
    "imageName": "banana",
    "price": 2400,
    "description": "달콤한 맛의 바나나. 이렇게 맛있으니 내가 바나나 안 바나나?",
    "isFavorite": true
  }
]
"""

struct JSONtoDictionary: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        if let jsonData = jsonString.data(using: .utf8) {
            do {
                let products = try JSONDecoder().decode([Product].self, from: jsonData)
                for product in products {
                    let productDict: [String: Any] = [
                        "name": product.name,
                        "imageName": product.imageName,
                        "price": product.price,
                        "description": product.description,
                        "isFavorite": product.isFavorite
                    ]
                    print(productDict)
                }
            } catch {
                print("❌ JSON 디코딩 오류: \(error.localizedDescription)")
            }
        }
    }
}

#Preview {
    JSONtoDictionary()
}
