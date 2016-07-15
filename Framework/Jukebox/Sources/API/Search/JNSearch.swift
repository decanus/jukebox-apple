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
    
    // TODO use real data type instead of string, better error handling
    public func search(query query: String, callback: ([String]) -> Void) {
        parameters["query"] = query
        
        Alamofire.request(.GET, baseUrl.absoluteString, parameters: parameters)
        .validate()
        .responseJSON { (response) in
            if response.result.isFailure {
                return callback([])
            }
            
            return callback([(response.result.value as! NSDictionary).description])
        }
    }
}
