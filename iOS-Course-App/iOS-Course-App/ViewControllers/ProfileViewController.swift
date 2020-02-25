//
//  ProfileViewController.swift
//  iOS-Course-App
//
//  Created by Demetra Staykova on 24.02.20.
//  Copyright © 2020 TsvetoslavVasev. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var profilePicture: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    var user: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupData()
    }
    
    func setupData() {
        //self.usernameLabel.text = (user?.firstName ?? "") + " " + (user?.lastName ?? "")
       // self.profilePicture.image = UIImage(named: "user")
       // self.emailLabel.text = user?.email
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
