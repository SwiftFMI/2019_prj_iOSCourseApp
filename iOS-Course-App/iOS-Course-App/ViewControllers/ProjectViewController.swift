//
//  ProjectViewController.swift
//  iOS-Course-App
//
//  Created by DemetraStaykova on 19.02.20.
//  Copyright © 2020 TsvetoslavVasev. All rights reserved.
//
import WebKit
import UIKit
import AVKit
import AVFoundation

class ProjectViewController: UIViewController {
    
    @IBOutlet weak var videoView: UIView!
    
    @IBOutlet weak var projectNameLabel: UILabel!
    @IBOutlet weak var projectDescriptionLabel: UILabel!
    @IBOutlet weak var gitRepositoryButton: UIButton!
    @IBOutlet weak var webView: WKWebView!
    
    var projectInfo: Project?
    var player = AVPlayer()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupData()
        self.title = "Project"
        
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
        var videoUrl = URL(string: "")
        if let url = projectInfo?.videoUrl {
            if url != "" {
                videoUrl = NSURL(string: url)! as URL
            }
            else {
               videoUrl = NSURL(string: "https://www.youtube.com/watch?v=nyp_PczrqFE")! as URL
            }
        } else {
           videoUrl = NSURL(string: "https://devstreaming-cdn.apple.com/videos/app_store/app-store-product-page/hls_vod_mvp.m3u8")! as URL
        }
        
        webView.configuration.allowsInlineMediaPlayback = true
        webView.configuration.mediaTypesRequiringUserActionForPlayback = []
        let request = URLRequest(url: videoUrl!)
        webView.load(request)
  
    /* alternative player, not supportin youtube
         
        let videoUrl = NSURL(string: projectInfo?.videoUrl ?? "https://devstreaming-cdn.apple.com/videos/app_store/app-store-product-page/hls_vod_mvp.m3u8")! as URL
        player = AVPlayer(url: videoUrl)
        let playerController = AVPlayerViewController()
        playerController.player = player
        self.showDetailViewController(playerController, sender: nil)
      playerController.view.frame = self.view.frame
        self.view.addSubview(playerController.view)
        player.play()
*/
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
