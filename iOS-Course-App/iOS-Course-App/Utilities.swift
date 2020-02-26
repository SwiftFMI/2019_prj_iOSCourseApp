//
//  Utilities.swift
//  customauth
//
//  Created by Christopher Ching on 2019-05-09.
//  Copyright © 2019 Christopher Ching. All rights reserved.
//

import Foundation
import UIKit

class Utilities {
    
    static func styleTextField(_ textfield:UITextField) {
        
        // Create the bottom line
        let bottomLine = CALayer()
        
        bottomLine.frame = CGRect(x: 0, y: textfield.frame.height - 2, width: textfield.frame.width, height: 2)
        
        bottomLine.backgroundColor = UIColor.init(red: 59/255, green: 98/255, blue: 125/255, alpha: 1).cgColor
        
        // Remove border on text field
        textfield.borderStyle = .none
        
        // Add the line to the text field
        textfield.layer.addSublayer(bottomLine)
        
    }
    
    static func styleFilledButton(_ button:UIButton) {
        
        // Filled rounded corner style
        button.backgroundColor = UIColor.init(red: 59/255, green: 98/255, blue: 125/255, alpha: 1)
        button.layer.cornerRadius = 25.0
        button.tintColor = UIColor.white
    }
    
    static func styleHollowButton(_ button:UIButton) {
        
        // Hollow rounded corner style
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.cornerRadius = 25.0
        button.tintColor = UIColor.black
    }
    
    static func styleTableViewCell(_ cell: UITableViewCell) {
        cell.layer.borderWidth = 15
        cell.layer.borderColor = UIColor.init(red: 59/255, green: 98/255, blue: 125/255, alpha: 0).cgColor
        cell.layer.backgroundColor = UIColor.clear.cgColor
        cell.indentationLevel = 1
        cell.textLabel?.textAlignment = .left
    }
    
    static func styleTableView(_ tableView: UITableView) {
        let backgroundImage = UIImage(named: "background")
        tableView.backgroundView = UIImageView(image: backgroundImage)
        tableView.backgroundView?.contentMode = .scaleAspectFill
        
        tableView.contentInset = UIEdgeInsets(top: 20.0, left: 0.0, bottom: 0.0, right: 0.0)
        
        tableView.separatorStyle = .none
    }
    
    static func resizeTableView(_ tableView: UITableView) {
        tableView.rowHeight = 200.0
    }
    
    static func styleTabBar(_ tabBar: UITabBar) {
        let backgroundImage = UIImage(named: "background")
        tabBar.backgroundImage = backgroundImage
    }
}
