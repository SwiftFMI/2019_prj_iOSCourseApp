//
//  UserRepository.swift
//  iOS-Course-App
//
//  Created by grade on 24.02.20.
//  Copyright © 2020 TsvetoslavVasev. All rights reserved.
//

import Foundation

class UserRepository {
    var users: [User] = []
    
    func addUser(user: User) {
        self.users.append(user)
    }
}
