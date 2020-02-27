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
    
    var user: User?
    
    @IBOutlet weak var videoView: UIView!
    @IBOutlet weak var headerButton: UIButton!
    @IBOutlet weak var projectNameLabel: UILabel!
    @IBOutlet weak var projectDescriptionLabel: UILabel!
    @IBOutlet weak var gitRepositoryButton: UIButton!
    @IBOutlet weak var webView: WKWebView!
    
    var projectInfo: Project?
    var player = AVPlayer()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupData()
        setupElements()
    }
    
    func setupData() {
        guard let project = projectInfo else {
            return
        }
        let courseYear = project.courseYear.components(separatedBy: "_");
        let year = courseYear[1] + "/" + courseYear[2]
        self.projectNameLabel.text = project.name + " " + year
        self.projectDescriptionLabel.text = project.description
        self.title = "Project"
    }
    
    func setupElements() {
        if let user = self.user {
            if user.loggedIn {
                headerButton.setImage(UIImage(named: "profile"), for: .normal)
            }
        } else {
            headerButton.setImage(UIImage(named: "login"), for: .normal)
        }
     }
    
    @IBAction func headerButtonTapped(_ sender: Any) {
        guard let user = self.user, let loginVC = self.storyboard?.instantiateViewController(identifier: "loginVC") as? LoginViewController, let profileVC = self.storyboard?.instantiateViewController(identifier: "profileVC") as? ProfileViewController else {
            return
        }
        
        if user.loggedIn {
            profileVC.user = self.user
            self.navigationController?.pushViewController(profileVC, animated: true)
        } else {
            self.navigationController?.pushViewController(loginVC, animated: true)
        }
    }
    
    @IBAction func gitRepositoryButtonTapped(
        _ sender: Any) {
        let urlHeader = "http://github.com/SwiftFMI/"
        let wholeUrl = urlHeader + (projectInfo?.gitRepository ?? "")
        let url = URL(string: wholeUrl)!
        
        UIApplication.shared.canOpenURL(url)
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
    
    @IBAction func playButtonTapped(_ sender: Any) {
        var videoUrl = URL(string: "")
        if let url = projectInfo?.videoUrl {
            if url != "" {
                videoUrl = URL(string: url)!
            }
            else {
               videoUrl = URL(string: "https://devstreaming-cdn.apple.com/videos/app_store/app-store-product-page/hls_vod_mvp.m3u8")
            }
        } else {
           videoUrl = URL(string: "https://www.youtube.com/watch?v=nyp_PczrqFE")
        }
 /*
        webView.configuration.allowsInlineMediaPlayback = true
        webView.configuration.mediaTypesRequiringUserActionForPlayback = []
        let request = URLRequest(url: videoUrl!)
        webView.load(request)
*/

        // alternative player, not supporting youtube
        player = AVPlayer(url: videoUrl!)
        let playerController = AVPlayerViewController()
        playerController.player = player
        self.showDetailViewController(playerController, sender: nil)
        playerController.view.frame = self.view.frame
        self.view.addSubview(playerController.view)
        player.play()

    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
