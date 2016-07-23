//
//  Player.swift
//  Jukebox
//
//  Created by Jeremy Stucki on 19/07/2016.
//
//

import Foundation

public protocol JNPlayer {
    
    func play()
    
    func pause()
    
    func setTrack(track: JNTrack)
    
    var platform: JNPlatform { get }
    
    var track: JNTrack? { get }
}
