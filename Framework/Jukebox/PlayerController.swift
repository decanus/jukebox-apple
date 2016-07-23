//
//  PlayerController.swift
//  Jukebox
//
//  Created by Jeremy Stucki on 19/07/2016.
//
//

import Foundation

public class JNPlayerController {
    
    private var currentPlayer: JNPlayer?
    
    private var queue = JNQueue()
    
    public func play() {
        if !queue.hasAnyTracks() {
            return
        }
        
        if queue.currentTrack.platform != currentPlayer?.platform {
            switch queue.currentTrack.platform {
            case .YouTube:
                currentPlayer = JNYouTubePlayer()
            default:
                currentPlayer = JNYouTubePlayer()
            }
        }
        
        if currentPlayer!.track == nil || queue.currentTrack != currentPlayer!.track! {
            currentPlayer!.setTrack(queue.currentTrack)
        }
        
        currentPlayer!.play()
    }
    
    public func pause() {
        currentPlayer?.pause()
    }
    
    public func previous() {
        if queue.hasPrevious() {
            queue.getPreviousTrack()
            play()
        }
    }
    
    public func next() {
        if queue.hasNext() {
            queue.getNextTrack()
            play()
        }
    }
}
