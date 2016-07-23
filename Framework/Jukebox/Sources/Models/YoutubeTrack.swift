//
//  YoutubeTrack.swift
//  jukebox
//
//  Created by Dean Eigenmann on 09/05/16.
//  Copyright © 2016 jukebox. All rights reserved.
//

import Foundation

public class JNYoutubeTrack: JNTrack {
    
    public let id: Int
    public let title: String
    public let artists: [JNArtist]
    public let platform: JNPlatform
    public var duration: NSTimeInterval
    
    public init(id: Int, title: String, artists: [JNArtist], duration: NSTimeInterval) {
        self.id = id
        self.title = title
        self.artists = artists
        self.platform = .YouTube
        self.duration = duration
    }

}
