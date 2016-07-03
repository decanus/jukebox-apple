//
//  Queue.swift
//  jukebox
//
//  Created by Dean Eigenmann on 10/05/16.
//  Copyright © 2016 jukebox. All rights reserved.
//

import Foundation

public class JNQueue: SequenceType {
    
    private var queue = [JNTrack]()
    
    private var currentTrack = 0
    
    private func getTrack(atIndex index: Int) -> JNTrack {
        return queue[index]
    }
    
    // Experimental
    public func generate() -> AnyGenerator<JNTrack> {
        var currentTrack = 0
        
        return AnyGenerator {
            if currentTrack < 0 {
                return nil
            }
            
            currentTrack += 1
            return self.queue[currentTrack]
        }
    }
    
    func addTrack(track: JNTrack) {
        queue.append(track)
    }
    
    public init() { }
    
//    func getNextTrack() -> JNTrack {
//        currentTrack += 1
//        return getTrack(atIndex: currentTrack)
//    }
//    
//    func getPreviousTrack() -> JNTrack {
//        currentTrack -= 1
//        return getTrack(atIndex: currentTrack)
//    }
//    
//    func getCurrentTrack() -> JNTrack {
//        return getTrack(atIndex: currentTrack)
//    }
//    
//    func getTrackAtIndex(index: Int) -> Track {
//        return queue[index]
//    }
//    
//    func hasNext() -> Bool {
//        return queue.count >= (currentTrack + 2)
//    }
//    
//    func hasPrevious() -> Bool {
//        if currentTrack == 0 {
//            return false
//        }
//        
//        return queue.startIndex < currentTrack
//    }
//    
//    func addTrack(track: Track) {
//        queue.append(track)
//    }
//    
//    func removeTrack(index: Int) {
//        queue.removeAtIndex(index)
//    }
//    
//    func clearQueue() {
//        queue.removeAll()
//    }
//    
//    func rewind() {
//        currentTrack = 0
//    }
//    
//    func getCurrentIndex() -> Int {
//        return currentTrack
//    }
    
}

public func += (left: JNQueue, right: JNTrack) {
    left.addTrack(right)
}

