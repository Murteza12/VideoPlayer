//
//  ViewController.swift
//  VideoPlayerTest
//
//  Created by Murteza on 01/06/2020.
//  Copyright © 2020 Murteza. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var videoView: UIView!
    var vidUrl = "https://vimeo.com/365814422"
    let videoPlayer = VidepPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func playButton(_ sender: Any) {
        self.videoPlayer.getPlayVideoUrl(url: self.vidUrl, view: self.videoView)
    }
    
}

