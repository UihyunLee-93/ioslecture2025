//
//  ContentView.swift
//  0212_SwiftUIEx01
//
//  Created by Uihyun.Lee on 2/12/25.
//

import SwiftUI

class CntClass{
    var count = 0
    
    init(_count: Int = 0) {
        
    }
}

struct HomeView: View {
    
    var countRef: CntClass = CntClass()
    //@State var count = 0
    
    var body: some View {
        VStack{
            Image(systemName: "house.fill")
                .resizable()
                .frame(width: 100, height: 100)
            Text("Welcome to Home")
                .padding(20)
            Button("증가") {
                print("증가 버튼 눌렀다", countRef.count)
                countRef.count += 1
            }
        }
    }
}
struct SettingsView: View {
    
    var body: some View {
        VStack{
            Image(systemName: "gear")
                .resizable()
                .frame(width: 100, height: 100)
            Text("Welcome to Settings")
                .padding(20)
            Button("증가") {
                print("버튼 누름")
            }
        }
        
    }
}
struct Profile: View {
    var body: some View {
        VStack{
            Image(systemName: "person.circle")
                .resizable()
                .frame(width: 100, height: 100)
            Text("Welcome to Profile")
        }
    }
}
struct ContentView: View {
    var body: some View {
        
        TabView {
            HomeView().tabItem {
                Label("Home", systemImage: "house")
            }
            SettingsView().tabItem {
                Label("Settings", systemImage: "gear")
            }
            Profile().tabItem {
                Label("Profile", systemImage: "person.circle")
            }
        }
    }
}

#Preview {
    ContentView()
}
