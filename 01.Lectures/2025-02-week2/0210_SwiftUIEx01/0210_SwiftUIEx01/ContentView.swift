//
//  ContentView.swift
//  0210_SwiftUIEx01
//
//  Created by Uihyun.Lee on 2/10/25.
//

import SwiftUI

struct CustomButton: View {
    var title: String
    var action: () -> Void

    var body: some View {
        Button(title, action: action)
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
    }
}

struct ContentView: View {
    var body: some View {
        CustomButton(title: "dummy") {
            print("tapped")
        }
        Text("hello")
            .font(.title)
            .multilineTextAlignment(.center)
            .padding()
        Button("btn") {
            
            print("btn tapped")
        }
        .padding()
    }
    
}

#Preview {
    ContentView()
}
