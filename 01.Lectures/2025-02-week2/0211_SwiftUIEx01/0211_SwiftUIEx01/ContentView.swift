//
//  ContentView.swift
//  0211_SwiftUIEx01
//
//  Created by Uihyun.Lee on 2/11/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
        Text("SwiftUI 실습")
                .font(.largeTitle)
                .foregroundColor(.red)
                .background(Color.yellow)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.blue))
                        
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
