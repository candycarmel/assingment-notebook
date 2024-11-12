//
//  ViewController.swift
//  assingment notebook
//
//  Created by MATTHEW FITCH on 10/29/24.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {
    var defaults = UserDefaults.standard
    
    var decoder = JSONDecoder()
    
    var encoder = JSONEncoder()

    @IBOutlet weak var buttonOutlet: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonOutlet.tintColor = .systemGreen
        // Do any additional setup after loading the view.
        if let curSaves = defaults.data(forKey: "allAssignments") {
            if let decoded = try? decoder.decode([👁️].self, from: curSaves) {
                if (decoded.count == 0)
                {
                    return
                }
                👹.assingments = decoded
            }
        }
        
//        if let something = try? encoder.encode( nil )
//        {
//            defaults.set(nil, forKey: "allAssignments")

//        }
        checkForPermission()
    }
    
    let notificationsCenter = UNUserNotificationCenter.current()
    
    func checkForPermission()
    {
//        testNotification()
        
        notificationsCenter.getNotificationSettings { settings in
            switch settings.authorizationStatus {
            case .authorized:
                print("AM I AUTHORIZED?")
            case .denied:
                print("deny ME?")
                return
            case .notDetermined:
                print("b")
                self.notificationsCenter.requestAuthorization(options: [.alert, .sound]) { didAllow, error in
                    if didAllow {
                        
                    }
                }
            default:
                print("why")
                return
            }
        }
    }
    
//    func testNotification() {
//        let content = UNMutableNotificationContent()
//        content.title = "Test Notification"
//        content.body = "This is a test."
//        content.sound = .default
//
//        // Trigger in 10 seconds
//        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 10, repeats: false)
//
//        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
//
//        notificationsCenter.add(request) { error in
//            if let error = error {
//                print("Error adding test notification: \(error.localizedDescription)")
//            } else {
//                print("Test notification scheduled!")
//            }
//        }
//    }


}

