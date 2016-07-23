//
//  SearchResult.swift
//  Jukebox
//
//  Created by Jeremy Stucki on 14/07/2016.
//
//

import Foundation

public protocol JNSearchResult {
    
    var resultTitle: String { get }
    var resultSubtitle: String { get }
    var resultType: JNSearchResultType { get }
}


public enum JNSearchResultType {
    
    case Artist, Track
}


extension JNTrack {
    
    public var resultTitle: String {
        return title
    }
    
    public var resultSubtitle: String {
        return artists[0].resultTitle
    }
    
    public var resultType: JNSearchResultType {
        return .Track
    }
    
}


extension JNArtist {
    
    public var resultTitle: String {
        return name
    }
    
    public var resultSubtitle: String {
        return ""
    }
    
    public var resultType: JNSearchResultType {
        return .Artist
    }
    
}
