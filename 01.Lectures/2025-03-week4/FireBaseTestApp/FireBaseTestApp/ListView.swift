//
//  ListView.swift
//  FireBaseTestApp
//
//  Created by Uihyun.Lee on 4/7/25.
//

import SwiftUI

struct ListView: View {
    @EnvironmentObject var dataManager: DataManager
    @State private var showPopup: Bool = false
    var body: some View {
        NavigationView {
            List(dataManager.apples, id: \.id) { apple in
                Text(apple.name)
            }
            .navigationTitle(Text("Apple List"))
            .navigationBarItems(trailing: Button(action: {
                showPopup.toggle()
            }, label: {
                Image(systemName: "plus")
            }))
            .sheet(isPresented: $showPopup) {
                NewAppleView()
            }
        }
    }
}

#Preview {
    ListView()
        .environmentObject(DataManager())
}
