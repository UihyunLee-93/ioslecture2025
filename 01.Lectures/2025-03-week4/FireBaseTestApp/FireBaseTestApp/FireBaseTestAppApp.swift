//
//  FireBaseTestAppApp.swift
//  FireBaseTestApp
//
//  Created by Uihyun.Lee on 4/7/25.
//

import SwiftUI
import Firebase
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}

@main
struct FireBaseTestAppApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject private var dataManager = DataManager()
    
    var body: some Scene {
        WindowGroup {
            //ListView()
                //.environmentObject(dataManager)
            ContentView()
                .environmentObject(dataManager)//
        }
    }
}
