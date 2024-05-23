//
//  ViewController.swift
//  ExPushNotification
//
//  Created by RLogixxTraining on 23/05/24.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        checkPermission()
    }

    func checkPermission() {
        let notificationCenter = UNUserNotificationCenter.current()
        notificationCenter.getNotificationSettings { (settings) in
            switch settings.authorizationStatus {
            case .authorized:
                self.dispatchNotification()
            case .denied:
                print("Notification permission denied")
                return
            case .notDetermined:
                notificationCenter.requestAuthorization(options: [.alert, .sound]) { (didAllow, error) in
                    if didAllow {
                        self.dispatchNotification()
                    } else {
                        print("User did not allow notifications")
                    }
                }
            default:
                return
            }
        }
    }

    func dispatchNotification() {
//        let identifier = "RoutineMessaging"
//        let title = "Good Morning"
//        let body = "How's your day?"
//        let hour = 17
//        let minute = 23
//        let isDaily = true
//
//        let notificationCenter = UNUserNotificationCenter.current()
//        let content = UNMutableNotificationContent()
//        content.title = title
//        content.body = body
//        content.sound = .default
//
//        var dateComponents = DateComponents()
//        dateComponents.hour = hour
//        dateComponents.minute = minute
//
//        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: isDaily)
//        let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)
//
//        notificationCenter.removePendingNotificationRequests(withIdentifiers: [identifier])
//        notificationCenter.add(request) { (error) in
//            if let error = error {
//                print("Error adding notification: \(error.localizedDescription)")
//            } else {
//                print("Notification scheduled successfully")
//            }
//        }
        
        let identifier = "ImmediateNotification"
               let title = "Welcome!"
               let body = "Thanks for installing the app. How's your day?"
               let timeInterval: TimeInterval = 5 // Trigger after 5 seconds

               let notificationCenter = UNUserNotificationCenter.current()
               let content = UNMutableNotificationContent()
               content.title = title
               content.body = body
               content.sound = .default

               let trigger = UNTimeIntervalNotificationTrigger(timeInterval: timeInterval, repeats: false)
               let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)

               notificationCenter.removePendingNotificationRequests(withIdentifiers: [identifier])
               notificationCenter.add(request) { (error) in
                   if let error = error {
                       print("Error adding notification: \(error.localizedDescription)")
                   } else {
                       print("Notification scheduled successfully")
                   }
               }
           }
        
//    }
}
