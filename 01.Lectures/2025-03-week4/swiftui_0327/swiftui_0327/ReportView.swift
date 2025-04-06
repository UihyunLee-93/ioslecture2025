//
//  ReportView.swift
//  swiftui_0327
//
//  Created by Uihyun.Lee on 3/27/25.
//


import SwiftUI

struct ReportView: View {
    var body: some View {
        VStack(spacing: 12) {
            Text("주간 리포트")
                .font(.title2)
                .bold()
            Divider()
            Text("할 일 완료: 10개")
            Text("집중 시간: 12시간 00분")
            Text("새로운 목표: 0개")
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 12).fill(Color.white).shadow(radius: 3))
    }
}
