//
//  YoutubePlayer.swift
//  jukebox
//
//  Created by Dean Eigenmann on 10/05/16.
//  Copyright © 2016 jukebox. All rights reserved.
//

import AVFoundation
import youtube_ios_player_helper

// @TODO move delegate
class YoutubePlayer: NSObject, PlayerProtocol, YTPlayerViewDelegate {
    
    private let playerView: YTPlayerView
    private let audioSession: AVAudioSession
//    let tracks = [Track]()
    
    init(audioSession: AVAudioSession) {
        playerView = YTPlayerView(frame: CGRect(x: 0, y: 0, width: 300, height: 200))
        self.audioSession = audioSession
        super.init()
        playerView.delegate = self
    }
    
    func pause() {
        playerView.pauseVideo()
    }
    
    func play() {
        playerView.playVideo()
    }
    
    func getPlayerView() -> YTPlayerView {
        return playerView
    }
    
    func setTrack(track: Track) {
        playerView.loadWithVideoId(track.getID(), playerVars: [
            "playsinline" : 1,
            "autoplay" : 1,
            "showinfo" : 0,
            "rel" : 0,
            "modestbranding" : 1,
            "controls" : 0,
            "origin" : "http://www.jukebox.ninja"
            ]
        )
    }
    
    func appendPlayerToView(view: UIView) {
        view.addSubview(playerView)
      
    }
    
    func playerViewDidBecomeReady(playerView: YTPlayerView) {
        playerView.playVideo()
    }
    
    func playerView(playerView: YTPlayerView, didChangeToState state: YTPlayerState) {
        
        print(UIApplication.sharedApplication().applicationState.rawValue)
        if UIApplication.sharedApplication().applicationState == .Background || UIApplication.sharedApplication().applicationState == .Inactive {
            self.play()
        }
        
//        switch state {
//        case YTPlayerState.Paused:
//            self.play()
//            break;
//        case YTPlayerState.Buffering:
//            self.play()
//            break;
//        default:
//            break;
//        }
    }
    
}