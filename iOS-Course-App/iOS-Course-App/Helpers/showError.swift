//
//  showError.swift
//  iOS-Course-App
//
//  Created by grade on 27.02.20.
//  Copyright © 2020 TsvetoslavVasev. All rights reserved.
//

import Foundation
import UIKit

func showError(viewController: UIViewController, errorLabel: UILabel, message: String) {
    errorLabel.text = message
    let alert = UIAlertController(title: "Error", message: message, preferredStyle: UIAlertController.Style.alert)
    alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
    viewController.present(alert, animated: true, completion: nil)
}
