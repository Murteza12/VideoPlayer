//
//  Videoplyer.swift
//  VideoPlayerTest
//
//  Created by Murteza on 01/06/2020.
//  Copyright © 2020 Murteza. All rights reserved.
//

import Foundation
import AVKit
import GPVideoPlayer
import AVFoundation
import HCVimeoVideoExtractor
class VidepPlayer: NSObject {
    
    var  videoURL:URL?
    
    let AVcontroller = AVPlayerViewController()
       lazy var avPlayer : AVPlayer = {
                 let player = AVPlayer()
                 return player
             }()
             
             lazy var avPlayerLayer : AVPlayerLayer = {
                 let layer = AVPlayerLayer(player: self.avPlayer)
                 return layer
             }()
    
    func PlayVideso(url:String,view:UIView)
        {
            if let url = URL(string: url){
                
                avPlayer = AVPlayer(url: url)
                
                AVcontroller.player = avPlayer
                AVcontroller.view.frame = view.frame
                view.addSubview(AVcontroller.view)
                
                //self.addChild(AVcontroller)
                
                avPlayer.play()
                
            }
        }
    
    // Using GpVideo Player
    
        func playVideo(url:URL,view:UIView){
                      if let player = GPVideoPlayer.initialize(with: view.bounds) {
                                 player.isToShowPlaybackControls = true
                                 
                                view.addSubview(player)
                                 
                                 player.loadVideos(with: [url])
                                 player.isToShowPlaybackControls = true
                                 player.isMuted = true
                                 player.playVideo()
                 }
             }

    // To low the video quality
    
    func getPlayVideoUrl(url:String,view:UIView){
        // "https://vimeo.com/365814422"
            if let url = URL(string: url) {
                HCVimeoVideoExtractor.fetchVideoURLFrom(url: url, completion: { ( video:HCVimeoVideo?, error:Error?) -> Void in
                
                    if let err = error {
                        
                        print("Error = \(err.localizedDescription)")
                        
                        DispatchQueue.main.async() {
 
                            self.videoURL = nil
    
                            print(err.localizedDescription)
                        }
                        return
                    }
                    
                    guard let vid = video else {
                        print("Invalid video object")
                        return
                    }
                    
                    print("Title = \(vid.title), url = \(vid.videoURL), thumbnail = \(vid.thumbnailURL)")
               
                            
                    DispatchQueue.main.async() {
                        self.videoURL = vid.videoURL[.Quality360p]
                        print("Url is --- \(self.videoURL?.absoluteString)")
                       
                        self.playVideo(url: self.videoURL!, view: view)
      
                    }
                })
            }
        }


    
}
