//
//  YouTubePlayer.swift
//  Jukebox
//
//  Created by Jeremy Stucki on 19/07/2016.
//
//

import Foundation
import AVKit
import XCDYouTubeKit
import AVFoundation

// TODO implement methods
public class JNYouTubePlayer: JNPlayer {
    
    private var player: AVPlayer?
    private var playbackSource: JNYouTubePlaybackSource?
    
    public init() { }

    public func play() {
        
    }
    
    public func pause() {
        
    }
    
    public var platform: JNPlatform {
        return .YouTube
    }

    public func setPlaybackSource(source: JNPlaybackSource) {
        self.playbackSource = (source as! JNYouTubePlaybackSource)
        
        XCDYouTubeClient.defaultClient().getVideoWithIdentifier(playbackSource!.id) { (video, error) in
            if let streamURL = (video?.streamURLs[XCDYouTubeVideoQualityHTTPLiveStreaming] ??
                video?.streamURLs[XCDYouTubeVideoQuality.HD720.rawValue] ??
                video?.streamURLs[XCDYouTubeVideoQuality.Medium360.rawValue] ??
                video?.streamURLs[XCDYouTubeVideoQuality.Small240.rawValue]) {
                
                do {
                    let test = try AVAudioPlayer(contentsOfURL: streamURL)
                    test.prepareToPlay()
                    test.play()
                } catch { }
                
                if self.player == nil {
                    self.player = AVPlayer(URL: streamURL)
                } else {
                    self.player!.replaceCurrentItemWithPlayerItem(AVPlayerItem(URL: streamURL))
                }
                
//                self.observer = self!.playerView.player?.addPeriodicTimeObserverForInterval(CMTimeMake(33, 1000), queue: dispatch_get_main_queue(), usingBlock: {
//                    time in
//                    self!.player.delegate?.player(self!.player, shouldUpdateElapsedTime: time)
//                })
//                
//                dispatch_async(dispatch_get_main_queue(), {
//                    self.player!.prepareToPlay()
//                    self.player!.play()
//                })
            }
        }
    }
}
