//
//  AssingmentViewController.swift
//  assingment notebook
//
//  Created by MATTHEW FITCH on 10/29/24.
//

import UIKit
import UserNotifications

class 👹 {
    static var assingments = [👁️]()
    static var currentSelected = 0
}

class AssingmentViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    let encoder = JSONEncoder()
    
    let defaults = UserDefaults.standard
    @IBOutlet weak var tableViewOutlet: UITableView!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        👹.assingments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "CellCell") as! CellCell
        
        let assingment = 👹.assingments[indexPath.row]
        // jesus
        
        let date = "\(String(assingment.dueDate.month ?? 0)) / \(String(assingment.dueDate.day ?? 0)) \(assingment.dueDate.year != Calendar.current.component(.year, from: Date()) ? "/ \(String(assingment.dueDate.year ?? 0))" : "")"
        
        print(date)
        cell.configure(date: date, name: assingment.description)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        👹.currentSelected = indexPath.row
        performSegue(withIdentifier: "view-assignment", sender: nil)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            👹.assingments.remove(at: indexPath.row); tableView.reloadData()
        }
        
        if let something = try? self.encoder.encode(👹.assingments)
        {
            defaults.set(something, forKey: "allAssignments")

        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewOutlet.delegate = self
        tableViewOutlet.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableViewOutlet.reloadData()
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
