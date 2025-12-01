//
//  NotificationManager.swift
//  MicroBudgeting
//
//  Created by Yuki Kuwahara on 11/30/25.
//

import UserNotifications

class NotificationManager {
    static func requestNotification() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
            if let error = error {
                print("Notification authorization error: \(error)")
            } else {
                print("Notification authorization success: \(success)")
            }
        }
    }
    
    // TODO: Create a static func that sends the notification
}
