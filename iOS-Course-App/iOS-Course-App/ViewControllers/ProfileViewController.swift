//
//  ProfileViewController.swift
//  iOS-Course-App
//
//  Created by grade on 27.02.20.
//  Copyright © 2020 TsvetoslavVasev. All rights reserved.
//

import UIKit
import FirebaseAuth

class ProfileViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var errorLabel: UILabel!
    var user: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupData()

        // Do any additional setup after loading the view.
    }
    
    func setupData() {
        guard let user = self.user else {
            return
        }
        self.errorLabel?.alpha = 0
        self.nameLabel?.text = user.firstName + " " + user.lastName
        self.emailLabel?.text = user.email
        self.title = "Profile"
    }
    
    func showError(_ message: String) {
        errorLabel.text = message
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func logoutButtonTapped(_ sender: Any) {
        do {
            try Auth.auth().signOut()
            guard let tabBarVC = self.storyboard?.instantiateViewController(withIdentifier: "TabBarVC") as? TabBarCoursesViewController else {
                return
            }
            
            tabBarVC.user = User()
            self.navigationController?.viewControllers[0] = tabBarVC
            self.navigationController?.popToRootViewController(animated: true)
        } catch let err {
            self.showError(err.localizedDescription)
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
