//
//  CourseCell.swift
//  iOS-Course-App
//
//  Created by Violeta Ilieva on 19.02.20.
//  Copyright © 2020 TsvetoslavVasev. All rights reserved.
//

import UIKit


class CourseCell: UITableViewCell {
    
    @IBOutlet weak var prImage: UIImageView!
    @IBOutlet weak var prTitle: UILabel!
    
    var projectItems: Projects!
    
    func setProject(project: Projects) {
        projectItems = project
        prTitle.text = projectItems.projectTitle
        prImage.images = projectItems.projectImage
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
