//
//  ProjectViewController.swift
//  iOS-Course-App
//
//  Created by DemetraStaykova on 19.02.20.
//  Copyright © 2020 TsvetoslavVasev. All rights reserved.
//

import UIKit

class ProjectViewController: UIViewController {
    

    @IBOutlet weak var projectNameLabel: UILabel!
    @IBOutlet weak var projectDescriptionLabel: UILabel!
    @IBOutlet weak var gitRepositoryButton: UIButton!
   
    var projectInfo: Project?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupElements()
    }
    
    func setupElements() {
        Utilities.styleFilledButton(gitRepositoryButton)
        setupData()
    }
    
    func setupData() {
        guard let project = projectInfo else {
            return
        }
        let courseYear = project.courseYear.components(separatedBy: "_");
        let year = courseYear[1] + "/" + courseYear[2]
        projectNameLabel.text = project.name + " " + year
        projectDescriptionLabel.text = project.description
    }
    @IBAction func gitRepositoryButtonTapped(
        _ sender: Any) {
        let url = URL(string: projectInfo?.gitRepository ?? "github.com/SwiftFMI")!
        
        UIApplication.shared.canOpenURL(url)
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
}
