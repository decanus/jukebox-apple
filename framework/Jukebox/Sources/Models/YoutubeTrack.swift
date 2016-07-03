//
//  YoutubeTrack.swift
//  jukebox
//
//  Created by Dean Eigenmann on 09/05/16.
//  Copyright © 2016 jukebox. All rights reserved.
//

import Foundation

public class JNYoutubeTrack: JNTrack {
    
    public let id: String
    public let title: String
    public let artist: String
    public let platform: JNPlatform
    public var duration: NSTimeInterval
    
    public init(id: String, title: String, artist: String, duration: NSTimeInterval) {
        self.id = id
        self.title = title
        self.artist = artist
        self.platform = JNPlatform.Youtube
        self.duration = duration
    }
    
}
