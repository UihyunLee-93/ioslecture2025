//
//  ContentView.swift
//  0212_SwiftUIEx02
//
//  Created by Uihyun.Lee on 2/12/25.
//

import SwiftUI

struct ContentView: View {
    @State var message: String = "버튼을클릭하세요"
    var body: some View {
        VStack {
            Text(message)
                .font(.title)
                .padding()
            
            
            Button(action:{
                message = "클릭되었습니다"
            }){
                Text("버튼")
                    .font(.headline)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding(.horizontal)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
