//
//  PlayerController.swift
//  Jukebox
//
//  Created by Jeremy Stucki on 19/07/2016.
//
//

import Foundation

public class JNPlayerController {
    
    private var queue = JNQueue()
    private var currentPlayer: JNPlayer?
    
    public func play() {
        if queue.tracks == nil {
            return
        }
        
        if currentPlayer == nil || !queue.currentTrack!.hasPlaybackSource(forPlatform: currentPlayer!.platform) {
            currentPlayer = JNPlayerFactory.createPlayer(forPlatform: queue.currentTrack!.playbackSources[0].platform)
        }
        
        currentPlayer!.setTrack(queue.currentTrack!)
        currentPlayer!.play()
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
