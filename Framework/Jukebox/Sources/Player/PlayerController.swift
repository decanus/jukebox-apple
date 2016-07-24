//
//  PlayerController.swift
//  Jukebox
//
//  Created by Jeremy Stucki on 19/07/2016.
//
//

import Foundation

public class JNPlayerController {
    
    public var queue = JNQueue()
    private var currentPlayer: JNPlayer?
    
    public init() { }
    
    public func play() {
        if queue.tracks == nil {
            return
        }
        
        if currentPlayer == nil || queue.currentTrack!.getPlaybackSource(forPlatform: currentPlayer!.platform) == nil {
            currentPlayer = JNPlayerFactory.createPlayer(forPlatform: queue.currentTrack!.playbackSources[0].platform)
        }
        
        currentPlayer!.setPlaybackSource(queue.currentTrack!.getPlaybackSource(forPlatform: currentPlayer!.platform)!)
    }

    public func pause() {
        currentPlayer?.pause()
    }
    
    public func next() {
        if queue.next() != nil {
            play()
        }
    }
    
    public func previous() {
        if queue.previous() != nil {
            play()
        }
    }
}
