//
//  Queue.swift
//  jukebox
//
//  Created by Dean Eigenmann on 10/05/16.
//  Copyright © 2016 jukebox. All rights reserved.
//

import Foundation

public class JNQueue {
    
    private var tracks = [JNTrack]()
    
    private var currentTrackIndex = 0
    
    public var currentTrack: JNTrack {
        return getTrack(atIndex: currentTrackIndex)
    }
    
    public init() { }
    
    private func getTrack(atIndex index: Int) -> JNTrack {
        return tracks[index]
    }
    
    func addTrack(track: JNTrack) {
        tracks.append(track)
    }
    
    func getNextTrack() -> JNTrack {
        currentTrackIndex += 1
        return getTrack(atIndex: currentTrackIndex)
    }
    
    func getPreviousTrack() -> JNTrack {
        currentTrackIndex -= 1
        return getTrack(atIndex: currentTrackIndex)
    }
    
    func hasNext() -> Bool {
        return tracks.count > currentTrackIndex
    }
    
    func hasPrevious() -> Bool {
        return currentTrackIndex > 0
    }
    
    func hasAnyTracks() -> Bool {
        return tracks.count != 0
    }
    
    func removeTrack(atIndex index: Int) {
        tracks.removeAtIndex(index)
    }
    
    func clear() {
        rewind()
        tracks.removeAll()
    }
    
    func rewind() {
        currentTrackIndex = 0
    }
    
    func getCurrentTrackIndex() -> Int {
        return currentTrackIndex
    }
    
}


public func += (left: JNQueue, right: JNTrack) {
    left.addTrack(right)
}
