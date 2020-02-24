//
//  WelcomeViewController.swift
//  iOS-Course-App
//
//  Created by grade on 24.02.20.
//  Copyright © 2020 TsvetoslavVasev. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet weak var startButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupData()
    }
    
    func setupData() {
        self.title = "iOS courses"
    }
    
    @IBAction func startedButtonTabbed(_ sender: Any) {
        guard let tabBarVC = self.storyboard?.instantiateViewController(identifier: "TabBarVC") as? TabBarCoursesViewController else {
            return
        }
        
        self.navigationController?.pushViewController(tabBarVC, animated: true)
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
