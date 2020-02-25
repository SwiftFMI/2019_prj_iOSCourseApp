//
//  Project.swift
//  iOS-Course-App
//
//  Created by Demetra Staykova on 24.02.20.
//  Copyright © 2020 TsvetoslavVasev. All rights reserved.
//

import Foundation

struct Project: Codable {
    let name: String
    let courseYear: String
    let description: String
    let videoUrl: String
    let image: String
    let gitRepository: String
}
