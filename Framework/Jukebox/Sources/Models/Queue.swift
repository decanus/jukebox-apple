//
//  Queue.swift
//  jukebox
//
//  Created by Dean Eigenmann on 10/05/16.
//  Copyright © 2016 jukebox. All rights reserved.
//

import Foundation

public class JNQueue {
    
    public var hasNextTrack: Bool { return tracks != nil && currentTrackIndex! + 1 < tracks!.count }
    public var hasPreviousTrack: Bool { return tracks != nil && currentTrackIndex != 0 }

    public var currentTrack: JNTrack? { return tracks?[currentTrackIndex!] }
    
    private var currentTrackIndex: Int?
    public var tracks: [JNTrack]? {
        didSet {
            if tracks?.count == 0 { tracks = nil }
            currentTrackIndex = tracks == nil ? nil : 0
        }
    }
    
    public func next() -> JNTrack? {
        if !hasNextTrack {
            return nil
        }
        
        currentTrackIndex! += 1
        return currentTrack
    }
    
    public func previous() -> JNTrack? {
        if !hasPreviousTrack {
            return nil
        }
        
        currentTrackIndex! -= 1
        return currentTrack
    }
    
    public func rewind() {
        if tracks != nil {
            currentTrackIndex = 0
        }
    }
}


public func += (left: JNQueue, right: JNTrack) {
    if left.tracks == nil {
        left.tracks = [right]
    } else {
        left.tracks!.append(right)
    }
}
