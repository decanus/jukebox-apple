//
//  Track.swift
//  jukebox
//
//  Created by Dean Eigenmann on 09/05/16.
//  Copyright © 2016 jukebox. All rights reserved.
//

import Foundation

public protocol JNTrack {
    
    var id: String { get }

    var title: String { get }
    
    var artist: String { get }

    var duration: NSTimeInterval { get set }
    
    var platform: JNPlatform { get }
    
}
