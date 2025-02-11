//
//  Ex03View.swift
//  0211_SwiftUIEx01
//
//  Created by Uihyun.Lee on 2/11/25.
//

import SwiftUI

struct Ex03View: View {
    let fruits = ["Apple", "Banana", "Orange","Pineapple", "Strawberry"]
    var body: some View {
        Text("과일 목록")
            .font(.title)
        List{
            
            ForEach(fruits, id: \.self) { fruit in  // ForEach로 배열 요소 순회
                Text(fruit)
                    .font(.title)          // 글자 크기를 title로 설정
                    .foregroundColor(.green)  // 텍스트 색상을 초록색으로 설정
                    .padding(.vertical, 5)  // 각 항목에 여백 추가
            }
        }
        .navigationTitle(Text("이스트 과일 쥬스"))
    }
}

#Preview {
    Ex03View()
}
