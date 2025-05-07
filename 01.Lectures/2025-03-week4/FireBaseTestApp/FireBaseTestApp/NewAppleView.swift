//
//  NewAppleView.swift
//  FireBaseTestApp
//
//  Created by Uihyun.Lee on 4/7/25.
//

import SwiftUI

struct NewAppleView: View {
    @EnvironmentObject var dataManager: DataManager
    @State private var newApple: String = ""
    var body: some View {
        VStack {
            TextField("Apple", text: $newApple)
            Button {
                dataManager.addApple(name: newApple)
                dataManager.fetchApples()
            }label: {
                Text("Save")
            }
                            
        }
    }
}

#Preview {
    NewAppleView()
}
