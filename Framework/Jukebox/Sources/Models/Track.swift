//
//  Track.swift
//  jukebox
//
//  Created by Dean Eigenmann on 09/05/16.
//  Copyright © 2016 jukebox. All rights reserved.
//

import Foundation

public protocol JNTrack: JNSearchResult {
    
    var id: Int { get }
    
    var title: String { get }
    
    var artists: [JNArtist] { get }
    
    var duration: NSTimeInterval { get set }
    
    var platform: JNPlatform { get }
    
}
