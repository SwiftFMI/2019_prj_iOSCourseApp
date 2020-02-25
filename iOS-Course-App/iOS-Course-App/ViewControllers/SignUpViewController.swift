//
//  SignUpViewController.swift
//  iOS-Course-App
//
//  Created by TsvetoslavVasev on 16.02.20.
//  Copyright © 2020 TsvetoslavVasev. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class SignUpViewController: UIViewController {

    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    
    var user: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupElements()
        setupData()
        self.hideKeyboardWhenTappedAround()
    }
    
    func setupData() {
        self.title = "Sign up"
    }
    
    func setupElements() {
        
        self.activityIndicator.isHidden = true
        errorLabel.alpha = 0
        
        Utilities.styleTextField(firstNameTextField)
        Utilities.styleTextField(lastNameTextField)
        Utilities.styleTextField(emailTextField)
        Utilities.styleTextField(passwordTextField)
        Utilities.styleFilledButton(signUpButton)
    }
    
    func validateFields() -> String? {
        
        // Check if all fields are filled in
        if firstNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
           lastNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
           emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            return "Please fill all fields"
        }
        return nil
    }
    
    func showError(_ message: String) {
        errorLabel.text = message
        errorLabel.text = message
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func transitionToLogin() {
        let size = self.navigationController?.viewControllers.count
        let rootVC = self.navigationController?.viewControllers[(size ?? 2)-2] as! LoginViewController
        rootVC.emailTextField.text = self.emailTextField.text
        rootVC.passwordTextField.text = self.passwordTextField.text
        rootVC.user = self.user
        self.navigationController?.viewControllers[0] = rootVC
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func signUpButtonTapped(_ sender: Any) {
        
        self.activityIndicator.isHidden = false
        self.activityIndicator.startAnimating()
        let error = validateFields()
        
        if error != nil {
            showError(error!)
        }
        else {
            
            let firstName = firstNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let lastName = lastNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            // Create user
            Auth.auth().createUser(withEmail: email , password: password) { (result, err) in
                
                // CHeck for errors
                if err != nil {
                    self.showError("Error creating user")
                }
                else {
                    
                    // User was created succesfully
                    let db = Firestore.firestore()
                    db.collection("users").addDocument(data: ["firstname":firstName, "lastname":lastName, "uid": result!.user.uid]) { (error) in
                        
                        if error != nil {
                            self.showError("Error saving user data")
                        }
                    }
                    
                    self.user = User(loggedIn: true, firstName: firstName, lastName: lastName, email: email)
                    // Transition to home screen
                    self.transitionToLogin()
                }
            }
        }
    }

//
//    override func prepare(for segue: UIStoryboardSegue!, sender: AnyObject!){
//
//        // Get the new view controller using segue.destinationViewController.
//        // Pass the selected object to the new view controller.
//    }
//
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
