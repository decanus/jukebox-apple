//
//  Track.swift
//  jukebox
//
//  Created by Dean Eigenmann on 09/05/16.
//  Copyright © 2016 jukebox. All rights reserved.
//

import Foundation

public class JNTrack: JNSearchResult {
    
    let id: Int
    let title: String
    let artists: [JNArtist]
    let playbackSources: [JNPlaybackSource]
    
    init(id: Int, title: String, artists: [JNArtist], playbackSources: [JNPlaybackSource]) {
        self.id = id
        self.title = title
        self.artists = artists
        self.playbackSources = playbackSources
    }
    
    public func getPlaybackSource(forPlatform platform: JNPlatform) -> JNPlaybackSource? {
        for source in playbackSources {
            if source.platform == platform {
                return source
            }
        }
        
        return nil
    }
}


public func == (lhs: JNTrack, rhs: JNTrack) -> Bool {
    return lhs.id == rhs.id
}

public func != (lhs: JNTrack, rhs: JNTrack) -> Bool {
    return lhs.id != rhs.id
}
