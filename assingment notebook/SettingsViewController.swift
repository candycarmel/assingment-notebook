//
//  SettingsViewController.swift
//  assingment notebook
//
//  Created by MATTHEW FITCH on 11/8/24.
//

import UIKit

class SettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func resetAction(_ sender: Any) {
        👹.assingments = [👁️]()
        let notificationCenter = UNUserNotificationCenter.current()
        for i in 0..<👹.assingments.count {
            notificationCenter.removePendingNotificationRequests(withIdentifiers: [👹.assingments[i].description])
        }
    }
    @IBAction func removeNotisAction(_ sender: Any) {
        let notificationCenter = UNUserNotificationCenter.current()
        for i in 0..<👹.assingments.count {
            👹.assingments[i].notis = .none
            notificationCenter.removePendingNotificationRequests(withIdentifiers: [👹.assingments[i].description])
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
