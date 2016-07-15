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
                }
            
                callback(results)
        }
    }

    // TODO add all artists
    private func parseTrack(data: NSDictionary) -> JNTrack {
        return JNYoutubeTrack(
            id: String(data["id"] as! Int),
            title: data["title"] as! String,
            artist: ((data["artists"] as! NSArray)[0] as! NSDictionary)["name"] as! String,
            duration: data["duration"] as! Double)
    }
}
