//
//  ProjectViewController.swift
//  iOS-Course-App
//
//  Created by DemetraStaykova on 19.02.20.
//  Copyright © 2020 TsvetoslavVasev. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class ProjectViewController: UIViewController {
    
    @IBOutlet weak var videoView: UIView!
    
    @IBOutlet weak var projectNameLabel: UILabel!
    @IBOutlet weak var projectDescriptionLabel: UILabel!
    @IBOutlet weak var gitRepositoryButton: UIButton!
   
    var projectInfo: Project?
    var player = AVPlayer()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupElements()
        self.title = "Project"
        
    }
    
    func setupElements() {
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
    
    @IBAction func playButtonTapped(_ sender: Any) {
        let videoUrl = NSURL(string: projectInfo?.videoUrl ?? "https://devstreaming-cdn.apple.com/videos/app_store/app-store-product-page/hls_vod_mvp.m3u8")!
        player = AVPlayer(url: videoUrl as URL)
        let playerController = AVPlayerViewController()
        playerController.player = player
        self.showDetailViewController(playerController, sender: nil)
      playerController.view.frame = self.view.frame
        self.view.addSubview(playerController.view)
        player.play()
    }

}
