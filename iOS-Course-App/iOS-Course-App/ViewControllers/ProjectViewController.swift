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
    
    var loggedIn: Bool?
    
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
        //addLoginHeader()
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
    
    func addLoginHeader() {
        if let login = loggedIn {
            if !login {
                let frame = self.view.frame
                let loginImage = UIImage(named: "login")
                let loginButton = UIButton(frame: CGRect(x: 325,y: 0,width: 25,height: 50))
                let color = UIColor.init(red: 115/255, green: 150/255, blue: 246/255, alpha: 0)
                loginButton.setTitle("Login", for: .normal)
                loginButton.setTitleColor(color, for: .normal)
                loginButton.setImage(loginImage, for: .normal)
                loginButton.addTarget(self, action: #selector(loginButtonTabbed), for: .touchUpInside)
                
                let loginHeader = UIView(frame: CGRect(x: 0,y: 0, width: frame.width, height: frame.height))
                loginHeader.addSubview(loginButton)
                self.view.addSubview(loginHeader)
            }
        }
    }
    
    @objc func loginButtonTabbed(sender: UIButton!) {
        guard let loginVC = self.storyboard?.instantiateViewController(identifier: "loginVC") as? LoginViewController else {
            return
        }
        
        self.navigationController?.pushViewController(loginVC, animated: true)
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
