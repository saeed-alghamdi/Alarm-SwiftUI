//
//  LocalNotification.swift
//  Alarm-SwiftUI
//
//  Created by RMP on 19/09/1447 AH.
//

import Foundation
import UserNotifications


let LOCAL_NOTIFICATION_IDENTIFIER: String = "LOCAL_NOTIFICATION_IDENTIFIER_3499"


// Local Notification Sender To The System
func localNotificationSender(notificationTitle title: String, notificationBody body: String, notificationRingtone ringtone: String, dateComponent: DateComponents, itsAboutTimeInterval: Bool, identifier: String) {
    
    let current = UNUserNotificationCenter.current()
    let content = UNMutableNotificationContent()
    content.title = title
    content.body = body
    content.sound = UNNotificationSound(named: UNNotificationSoundName(ringtone))
    
    if itsAboutTimeInterval == true {
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 300, repeats: false)
        let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)
        current.add(request)
        
    } else {
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponent, repeats: false)
        let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)
        current.add(request)
        
    }
    
}


// Notification Permissions
func checkLocalNotificationAuthorization(notificationTitle title: String, notificationBody body: String, notificationRingtone ringtone: String, dateComponents: DateComponents, itsAboutTimeInterval: Bool, identifier: String) {
    
    let current = UNUserNotificationCenter.current()
    
    current.getNotificationSettings { settings in
        
        if settings.authorizationStatus == .authorized {
            
            localNotificationSender(notificationTitle: title, notificationBody: body, notificationRingtone: ringtone, dateComponent: dateComponents, itsAboutTimeInterval: itsAboutTimeInterval, identifier: identifier)
            
        } else {
            
            current.requestAuthorization(options: [.alert, .badge, .sound]) { authorized, nonAuthorized in
                
                if authorized {
                    
                    localNotificationSender(notificationTitle: title, notificationBody: body, notificationRingtone: ringtone, dateComponent: dateComponents, itsAboutTimeInterval: itsAboutTimeInterval, identifier: identifier)
        
                } else {
                    
                    print("User denied the local notification")
                    
                }
                
            }
            
        }
        
    }
    
}


// Local Notification Remover
func removeNotification(withIdentifier identifier: String) {
    let center = UNUserNotificationCenter.current()
    center.removePendingNotificationRequests(withIdentifiers: [identifier])
    center.removeDeliveredNotifications(withIdentifiers: [identifier])
}
