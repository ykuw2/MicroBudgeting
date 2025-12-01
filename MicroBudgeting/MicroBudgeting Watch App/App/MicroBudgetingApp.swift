//
//  MicroBudgetingApp.swift
//  MicroBudgeting Watch App
//
//  Created by Yuki Kuwahara on 11/28/25.
//

import SwiftUI

@main
struct MicroBudgeting: App {
    
    init() {
        NotificationManager.requestNotification()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
