//
//  ContentView.swift
//  swiftui_0331
//
//  Created by Uihyun.Lee on 3/31/25.
//

import SwiftUI
import Combine

class CounterViewModel: ObservableObject {
    @Published var count: Int = 0
}


struct CounterView: View {
    @ObservedObject var viewModel: CounterViewModel
    var body: some View {
        VStack {
            Text("Counter: \(viewModel.count)").font(.title)
            
            Button("증가"){
                viewModel.count += 1
            }
            .padding()
        }
        .padding()
    }
}

#Preview {
    CounterView(viewModel: CounterViewModel())
}
