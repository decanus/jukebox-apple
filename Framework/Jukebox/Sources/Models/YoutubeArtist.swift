//
//  YoutubeArtist.swift
//  Jukebox
//
//  Created by Jeremy Stucki on 15/07/2016.
//
//

import Foundation

public class JNYoutubeArtist: JNArtist {
    
    public let id: Int
    public let name: String
    public let permalink: String
    
    public init(id: Int, name: String, permalink: String) {
        self.id = id
        self.name = name
        self.permalink = permalink
    }

}
