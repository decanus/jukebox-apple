//
//  YoutubeTrack.swift
//  jukebox
//
//  Created by Dean Eigenmann on 09/05/16.
//  Copyright © 2016 jukebox. All rights reserved.
//

import Foundation

public class YoutubeTrack: JNTrack {
    
    public private(set) var id: String {
        get { return self.id }
        set(id) { self.id = id }
    }
    
    public private(set) var title: String {
        get { return self.title }
        set(title) { self.title = title }
    }
    
    public private(set) var artist: String {
        get { return self.artist }
        set(artist) { self.artist = artist }
    }
    
    public var duration: NSTimeInterval {
        get { return self.duration}
        set(duration) { self.duration = duration }
    }
    
    public private(set) var platform: JNPlatform {
        get { return self.platform }
        set(platform) { self.platform = platform }
    }
    
    init(id: String, title: String, artist: String, duration: NSTimeInterval) {
        self.id = id
        self.title = title
        self.artist = artist
        self.duration = duration
    }
    
}
