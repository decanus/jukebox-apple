//
//  JNSearch.swift
//  Jukebox
//
//  Created by Jeremy Stucki on 01/07/2016.
//
//

import Alamofire
import Foundation

public class JNSearch {
    
    private let baseUrl = NSURL(string: "\(JNConfiguration.baseUrl)/search")!
    private var parameters = ["key": JNConfiguration.apiKey]
    
    public init() { }
    
    public func search(query query: String, callback: ([JNSearchResult]) -> Void) {
        parameters["query"] = query
        
        Alamofire.request(.GET, baseUrl.absoluteString, parameters: parameters)
        .validate()
        .responseJSON { (response) in

                if response.result.isFailure {
                    return callback([])
                }

                if (response.result.value as? NSArray) != nil {
                    return callback([])
                }

                var results = [JNSearchResult]()

                for entry in (response.result.value as! NSDictionary)["results"] as! NSArray {
                    let data = entry as! NSDictionary
                    
                    if data["type"] as! String == "tracks" {
                        results.append(self.parseTrack(data))
                    }
                    
                    if data["type"] as! String == "artists" {
                        results.append(self.parseArtist(data))
                    }
                }
            
                callback(results)
        }
    }
    
    private func parseArtist(data: NSDictionary) -> JNArtist {
        return JNArtist(
            id: data["id"] as! Int,
            name: data["name"] as! String,
            permalink: data["permalink"] as! String)
    }
    
    private func parseArtists(data: NSArray) -> [JNArtist] {
        var artists = [JNArtist]()
        
        for element in data {
            artists.append(parseArtist(element as! NSDictionary))
        }
        
        return artists
    }
    
    private func parseSource(data: NSDictionary) -> JNPlaybackSource! {
        if data["source"] as! String == "youtube" {
            return JNYouTubePlaybackSource(
                id: data["source_data"] as! String,
                duration: data["duration"] as! Double)
        }
        
        return nil
    }
    
    private func parseSources(data: NSArray) -> [JNPlaybackSource] {
        var playbackSources = [JNPlaybackSource]()
        
        for element in data {
            playbackSources.append(parseSource(element as! NSDictionary))
        }
        
        return playbackSources
    }

    private func parseTrack(data: NSDictionary) -> JNTrack {
        return JNTrack(
            id: data["id"] as! Int,
            title: data["title"] as! String,
            artists: parseArtists(data["artists"] as! NSArray),
            playbackSources: parseSources(data["sources"] as! NSArray))
    }
    
}
