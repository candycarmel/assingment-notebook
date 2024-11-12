//
//  ViewAssignmentViewController.swift
//  assingment notebook
//
//  Created by MATTHEW FITCH on 11/11/24.
//

import UIKit

class ViewAssignmentViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var dueLabel: UILabel!
    
    @IBOutlet weak var notificationsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let cur = 👹.assingments[👹.currentSelected]
        
        nameLabel.text = cur.description
        
        let date = "\(String(cur.dueDate.month ?? 0)) / \(String(cur.dueDate.day ?? 0)) \(cur.dueDate.year != Calendar.current.component(.year, from: Date()) ? "/ \(String(cur.dueDate.year ?? 0))" : "")"
        
        dueLabel.text = "Due date: " + date
        
        notificationsLabel.text = "Notifications: \(cur.notis == .none ? "None" : cur.notis == .nightBefore ? "Night before" : "24 hours before")"
        // Do any additional setup after loading the view.
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
