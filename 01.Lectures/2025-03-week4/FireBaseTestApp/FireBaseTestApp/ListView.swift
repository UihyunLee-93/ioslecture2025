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

    init() {
        UITableView.appearance().backgroundColor = .clear
        UITableViewCell.appearance().backgroundColor = .clear
    }

    var body: some View {
        ZStack {
            // 배경
            Color.cyan.ignoresSafeArea()
            ZStack {
                RoundedRectangle(cornerRadius: 30, style: .continuous)
                    .foregroundStyle(.linearGradient(colors: [.blue, .red], startPoint: .topLeading, endPoint: .bottomTrailing))
                    .frame(width: 1000, height: 1000)
                    .rotationEffect(.degrees(-150))
                    .offset(y: 350)

                RoundedRectangle(cornerRadius: 30, style: .continuous)
                    .foregroundStyle(.linearGradient(colors: [.blue, .red], startPoint: .topLeading, endPoint: .bottomTrailing))
                    .frame(width: 1000, height: 500)
                    .rotationEffect(.degrees(150))
                    .offset(y: 350)
            }

            // 리스트
            NavigationView {
                List(dataManager.apples, id: \.id) { apple in
                    Text(apple.name)
                        .foregroundColor(.white)
                }
                .listStyle(.plain)
                .scrollContentBackground(.hidden) // ✅ 중요!
                .navigationTitle("Apple List")
                .navigationBarItems(trailing: Button(action: {
                    showPopup.toggle()
                }) {
                    Image(systemName: "plus")
                        .foregroundColor(.white)
                })
                .sheet(isPresented: $showPopup) {
                    NewAppleView()
                }
            }
            .background(Color.clear)
        }
    }
}

#Preview {
    ListView()
        .environmentObject(DataManager())
}
