//
//  NewViewController.swift
//  assingment notebook
//
//  Created by MATTHEW FITCH on 10/30/24.
//

import UIKit

class NewViewController: UIViewController, UITextFieldDelegate {
    var defaults = UserDefaults.standard
    var encoder = JSONEncoder()
    
    @IBOutlet weak var buttonOutlet: UIButton!
    var notificationPref = PushNotis.none
    var selectedDate = DateComponents(calendar: Calendar.current, timeZone: TimeZone.current)
    @IBOutlet weak var nameOutlet: UITextField!
    @IBOutlet weak var dateOutlet: UIDatePicker!
    @IBOutlet weak var menuOutlet: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameOutlet.delegate = self
        buttonOutlet.tintColor = .systemGreen
        setPopupButton()
        
        dateOutlet.datePickerMode = .dateAndTime
        dateOutlet.addTarget(self, action: #selector(dateChanged), for: .valueChanged)
//         Do any additional setup after loading the view.
    }
    
    
    @objc func dateChanged() {
            let selectedDate = dateOutlet.date
            
            // Use Calendar to extract components
            let calendar = Calendar.current
            var components = calendar.dateComponents([.year, .month, .day, .hour, .minute], from: selectedDate)
            
            if let year = components.year,
               let month = components.month,
               let day = components.day,
               let hour = components.hour,
               let minute = components.minute {
                self.selectedDate = components
            }
        }
    

    func setPopupButton()
    {
        let optionClosure = {(action : UIAction) in
            switch action.title {
            case "No notifications":
                self.notificationPref = PushNotis.none
            case "24 Hours before":
                self.notificationPref = PushNotis.dayBefore
            case "Night Before":
                self.notificationPref = PushNotis.nightBefore
            default:
                break
            }
        }
        
        menuOutlet.menu = UIMenu(children: [
            UIAction(title: "No notifications", state: .on, handler: optionClosure),
            UIAction(title: "24 Hours before", handler: optionClosure),
            UIAction(title: "Night before", handler: optionClosure),
        ])
        
        menuOutlet.showsMenuAsPrimaryAction = true
        
        menuOutlet.changesSelectionAsPrimaryAction = true
    }

    @IBAction func addButtonAction(_ sender: Any) {
        let today = Calendar.current
        
        let date = Date()
        
        let year = today.component(.year, from: date)
        let month = today.component(.month, from: date)
        let day = today.component(.day, from: date)
        let hour = today.component(.hour, from: date)
        let minute = today.component(.minute, from: date)
        var newAssingment = 👁️(description: nameOutlet.text ?? "", notis: notificationPref, dueDay: 💀(year: selectedDate.year ?? year, month: selectedDate.month ?? month, day: selectedDate.day ?? day), dueHour: selectedDate.hour ?? hour, dueMinute: selectedDate.minute ?? minute)
        if newAssingment.notis != .none
        {
             if (dispatchNotification(identifier: newAssingment.description, hour: newAssingment.dueDate.hour ?? 0, minute: newAssingment.dueDate.minute ?? 0, day: newAssingment.dueDate.day ?? 0, month: newAssingment.dueDate.month ?? 0, year: newAssingment.dueDate.year ?? 0, type: newAssingment.notis) == 0)
            {
                 return
            }
        }
        👹.assingments.append(newAssingment)
        
        if let something = try? self.encoder.encode(👹.assingments)
        {
            defaults.set(something, forKey: "allAssignments")

        }
        nameOutlet.text = ""
        createAlert(alertName: "Assignment added successfully!", alertTitle: "Success!")
    }
    
    func dispatchNotification(identifier: String, hour: Int, minute: Int, day: Int, month: Int, year: Int, type: PushNotis) -> Int {
        
        let isDaily = false
        let notificationCenter = UNUserNotificationCenter.current()
        
        let calendar = Calendar.current
        
        let content = UNMutableNotificationContent()
        content.title = identifier
        content.sound = .default
        
        // Create the target date components
        var dateComponents = DateComponents()
        dateComponents.year = year
        dateComponents.month = month
        dateComponents.day = day
        dateComponents.hour = (type == .dayBefore) ? hour - 24 : 19 // 24 hours before for `.dayBefore`, 19:00 for other types
        dateComponents.minute = (type == .dayBefore) ? minute : 0
        guard let targetDate = calendar.date(from: dateComponents) else {
            print("Error: Unable to create target date from components")
            return 0
        }
        
        let currentDate = Date()
        let timeInterval = targetDate.timeIntervalSince(currentDate)
        
        print("I am going to do unspeakable things \(timeInterval)")
        
        if (timeInterval < 0)
        {
            createAlert(alertName: "Bad date", alertTitle: "Error")
            return 0
        }
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: timeInterval, repeats: false)
        
        let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)
        
        notificationCenter.removePendingNotificationRequests(withIdentifiers: [identifier])
        
        notificationCenter.add(request) { error in
            if let error = error {
                print("Error adding notification: \(error.localizedDescription)")
            } else {
                print("Notification scheduled successfully!")
            }
        }
        return 1
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        nameOutlet.resignFirstResponder()
    }
    
    func createAlert(alertName: String, alertTitle: String)
    {
        let alert = UIAlertController(title: alertTitle, message: alertName, preferredStyle: UIAlertController.Style.alert)
        let alertAction = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil)
        
        alert.addAction(alertAction)
        
        self.present(alert, animated: true)
        
    }
}
