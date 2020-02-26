//
//  LoginViewController.swift
//  iOS-Course-App
//
//  Created by TsvetoslavVasev on 16.02.20.
//  Copyright © 2020 TsvetoslavVasev. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class LoginViewController: UIViewController {

    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var goToSignUpButton: UIButton!
    
    var user: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupElements()
        setupData()
        self.hideKeyboardWhenTappedAround()
    }
    
    func setupData() {
        self.title = "Login"
    }
    
    func setupElements() {
        
        errorLabel.alpha = 0
        
        Utilities.styleTextField(emailTextField)
        Utilities.styleTextField(passwordTextField)
        Utilities.styleFilledButton(loginButton)
        Utilities.styleFilledButton(goToSignUpButton)
        self.activityIndicator.isHidden = true
        
    }
    
    func validateFields() -> String? {
        
        // Check if all fields are filled in
        if  emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            return "Please fill all fields"
        }
        return nil
    }
    
    func showError(_ message: String) {
        errorLabel.text = message
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func transitionToTabBarVC(_ user: User?) {
        guard let tabBarVC = self.storyboard?.instantiateViewController(identifier: "TabBarVC") as? TabBarCoursesViewController else {
               return
        }
        tabBarVC.user = user ?? User(loggedIn: true)
        self.navigationController?.viewControllers[0] = tabBarVC
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func logInButtonTapped(_ sender: Any) {
        
        self.activityIndicator.isHidden = false
        self.activityIndicator.startAnimating()
        // Validate fields
        let error = validateFields()
        
        if error != nil {
            showError(error!)
        }
        else {
            let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            // Sign In
            Auth.auth().signIn(withEmail: email, password: password) { (result, err) in
            
                if let err = err {
                    self.showError(err.localizedDescription)
                }
                else {
                    if let user = self.user {
                        self.transitionToTabBarVC(user)
                    } else {

                        let db = Firestore.firestore()
                        let collection = db.collection("users")
                        let currentUser = Auth.auth().currentUser
                        if let currentUser = currentUser {
                            let uid = currentUser.uid // as String
                            collection.whereField("uid", isEqualTo: uid).getDocuments { (document, error) in
                                if let err = error {
                                    print(err)
                                } else {
                                    if let document = document {
                                        let data = document.documents[0].data()
                                        let firstName = data["firstname"] as! String
                                        let lastName = data["lastname"] as! String
                                        let email = currentUser.email as! String
                                        self.user = User(loggedIn: true, firstName: firstName, lastName: lastName, email: email)
                                        // it's not decoding from json-formatted db, because there's no email field in data, as well as loggedIn information. 
                                        // to do init from decoder, has to change the db storing 

                                        //self.transitionToTabBarVC(self.user)
                                        guard let tabBarVC = self.storyboard?.instantiateViewController(identifier: "TabBarVC") as? TabBarCoursesViewController else {
                                            return
                                        }
                                        tabBarVC.user = self.user ?? User(loggedIn: true)
                                        self.navigationController?.viewControllers[0] = tabBarVC
                                        self.navigationController?.popToRootViewController(animated: true)
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

