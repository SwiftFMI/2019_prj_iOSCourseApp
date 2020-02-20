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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.selectedIndex = 1
        self.title = "Courses years"
    }
}
