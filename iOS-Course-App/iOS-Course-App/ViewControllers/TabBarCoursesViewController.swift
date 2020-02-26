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
            (tabs[0] as? PastTableViewController)?.loggedIn = self.user.loggedIn
            (tabs[1] as? PresentCoursesTableViewController)?.loggedIn = self.user.loggedIn
            (tabs[2] as? FutureTableViewController)?.loggedIn = self.user.loggedIn
        }
        if self.user.loggedIn {
            if var tabs = self.viewControllers {
                guard let profileVC = self.storyboard?.instantiateViewController(withIdentifier: "profileVC") as? ProfileViewController else {
                    return
                }
                profileVC.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(named: "profile"), tag: 3)
                tabs.append(profileVC)
                self.viewControllers = tabs
                self.viewControllers?[3] = UINavigationController(rootViewController: tabs[3])
                (self.viewControllers?[3] as? ProfileViewController)?.user = self.user
            }
        }
        self.selectedIndex = 1
    }
}
