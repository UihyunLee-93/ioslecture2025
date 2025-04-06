//
//  _327App.swift
//  0327
//
//  Created by Uihyun.Lee on 3/27/25.
//

import SwiftUI

@main
struct _327App: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
