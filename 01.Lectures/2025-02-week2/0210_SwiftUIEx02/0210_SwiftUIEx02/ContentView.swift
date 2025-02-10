//
//  ContentView.swift
//  0210_SwiftUIEx02
//
//  Created by Uihyun.Lee on 2/10/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("기본 텍스트")
            Text("큰 글자").font(.largeTitle)
            Text("굵은 글자").bold()
            Text("기울어진 글자").italic()
            Text("밑줄 표시").underline()
            Text("줄 간격 설정")
                .lineSpacing(10)
            Text("다양한 스타일 적용")
                .font(.title)
                .foregroundColor(.purple)
                .background(Color.yellow)
                .padding()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
