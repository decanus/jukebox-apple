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

// TODO implement methods
public class JNYouTubePlayer: JNPlayer {
    
    private var player: AVPlayer?
    private var track: JNTrack?
    
    public init() { }

    public func play() {
        
    }
    
    public func pause() {
        
    }
    
    public var platform: JNPlatform {
        return .YouTube
    }

    public func setTrack(track: JNTrack) {
        self.track = track
    }
}
