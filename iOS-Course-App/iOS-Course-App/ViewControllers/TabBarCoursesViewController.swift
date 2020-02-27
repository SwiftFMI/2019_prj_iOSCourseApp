//
//  TabBarCoursesViewController.swift
//  iOS-Course-App
//
//  Created by Violeta Ilieva on 19.02.20.
//  Copyright © 2020 TsvetoslavVasev. All rights reserved.
//

import Foundation
import UIKit

class TabBarCoursesViewController : UITabBarController {
    
    var user = User(loggedIn: false, firstName: "", lastName: "", email: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupData()
        setupElements()
    }
    
    func setupData() {
        self.title = "Courses years"
    }
    
    func setupElements() {
        Utilities.styleTabBar(self.tabBar)
        
        self.navigationItem.hidesBackButton = true
        if let tabs = self.viewControllers {
            (tabs[0] as? PastTableViewController)?.user = self.user
            (tabs[1] as? PresentCoursesTableViewController)?.user = self.user
            (tabs[2] as? FutureTableViewController)?.user = self.user
        }
        
        self.selectedIndex = 1
    }
}
