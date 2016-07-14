//
//  JNSearchInteractor.swift
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
    
    // TODO use real data type instead of string E.g. JNSearchResult
    public func search(query query: String, callback: ([String]) -> Void) {
        parameters["query"] = query
        
        Alamofire.request(.GET, "\(baseUrl.absoluteString)/v1/search", parameters: parameters)
        .validate()
        .responseJSON { (response) in
            if response.result.isFailure {
                return callback([])
            }
            
            return callback([(response.result.value as! NSArray).description])
        }
    }
}
