//
//  CellCell.swift
//  assingment notebook
//
//  Created by MATTHEW FITCH on 11/1/24.
//

import Foundation

import UIKit
class CellCell: UITableViewCell {
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    func configure(date: String, name: String)
    {
        dateLabel.text = date
        
        nameLabel.text = name
    }
}
