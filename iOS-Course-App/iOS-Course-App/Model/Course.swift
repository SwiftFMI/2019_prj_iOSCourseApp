//
//  Course.swift
//  iOS-Course-App
//
//  Created by Demetra Staykova on 24.02.20.
//  Copyright © 2020 TsvetoslavVasev. All rights reserved.
//

import Foundation

struct Course: Codable {
    let year: String
    let gitRepository: String
    let projects: [Project]
}
