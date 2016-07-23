//
//  PlaybackSource.swift
//  Jukebox
//
//  Created by Jeremy Stucki on 23/07/2016.
//
//

import Foundation

public protocol JNPlaybackSource {
    
    var platform: JNPlatform { get }
    
    var duration: Double { get }
}
