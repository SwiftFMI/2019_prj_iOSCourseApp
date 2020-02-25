//
//  User.swift
//  iOS-Course-App
//
//  Created by Demetra Staykova on 24.02.20.
//  Copyright © 2020 TsvetoslavVasev. All rights reserved.
//

import Foundation

struct User: Codable {
    var loggedIn: Bool = false
    var firstName: String = ""
    var lastName: String = ""
    var email: String = ""
    
    init(loggedIn: Bool, firstName: String, lastName: String, email: String) {
        self.loggedIn = loggedIn
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
    }
}
