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
    
    func setPlaybackSource(source: JNPlaybackSource)
    
    var platform: JNPlatform { get }
}
