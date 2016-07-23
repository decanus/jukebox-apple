//
//  YouTubePlaybackSource.swift
//  Jukebox
//
//  Created by Jeremy Stucki on 23/07/2016.
//
//

import Foundation

class JNYouTubePlaybackSource: JNPlaybackSource {
    
    let id: String
    let duration: Double
    
    var platform: JNPlatform { return .YouTube }
    
    init(id: String, duration: Double) {
        self.id = id
        self.duration = duration
    }
}
