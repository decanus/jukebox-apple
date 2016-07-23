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

public class JNYouTubePlayer: JNPlayer {
    
    private var player: AVPlayer?
    private var _track: JNTrack?
    
    public init() { }
    
    public var track: JNTrack? {
        return _track
    }
    
    public func play() {
        
    }
    
    public func pause() {
        
    }
    
    
    public var platform: JNPlatform {
        return .YouTube
    }

    // TODO use JNYouTubeTrack
    public func setTrack(track: JNTrack) {
        self._track = track
        
        XCDYouTubeClient.defaultClient().getVideoWithIdentifier(String(track.id)) { [weak self] (video: XCDYouTubeVideo?, error: NSError?) in
            if let streamURL = (video?.streamURLs[XCDYouTubeVideoQualityHTTPLiveStreaming] ??
                video?.streamURLs[XCDYouTubeVideoQuality.HD720.rawValue] ??
                video?.streamURLs[XCDYouTubeVideoQuality.Medium360.rawValue] ??
                video?.streamURLs[XCDYouTubeVideoQuality.Small240.rawValue]) {

                self!.player = AVPlayer(URL: streamURL)
                
                dispatch_async(dispatch_get_main_queue(), {
                    self!.player!.play()
                })
            }
        }
    }
}

//    private let view = AVPlayerViewController()
//    private var _track: JNTrack?
//    
//    public var track: JNTrack? {
//        return _track
//    }
//    
//    func play() {
//        view.player?.play()
//    }
//    
//    func pause() {
//        view.player?.pause()
//    }
//    
//    var platform: JNPlatform {
//        return .YouTube
//    }
//    
//    func setTrack(track: JNTrack) {
//        self._track = track
//        
//        XCDYouTubeClient.defaultClient().getVideoWithIdentifier(track.getID()) { [weak self] (video: XCDYouTubeVideo?, error: NSError?) in
//            
//        }
//    }
//}
