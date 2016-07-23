//
//  Playlist.swift
//  jukebox
//
//  Created by Dean Eigenmann on 09/05/16.
//  Copyright © 2016 jukebox. All rights reserved.
//

import Foundation

public class JNPlaylist {
    
    private var _tracks = [JNTrack]()
    public var tracks: [JNTrack] {
        return _tracks
    }
    
    public var totalDuration: NSTimeInterval {
        var duration = 0.0
        
        for track in tracks {
            duration += track.playbackSources[0].duration
        }
        
        return duration
    }

    func addTrack(track: JNTrack) {
        _tracks.append(track)
    }
    
}


public func += (left: JNPlaylist, right: JNTrack) {
    left.addTrack(right)
}
