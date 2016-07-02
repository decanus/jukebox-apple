//
//  JNConfiguration.swift
//  Jukebox
//
//  Created by Jeremy Stucki on 02/07/2016.
//
//

import Foundation

public struct JNConfiguration {
    
    static public private(set) var baseUrl: NSURL {
        get { return self.baseUrl }
        set(baseUrl) { self.baseUrl = baseUrl }
    }
    
    static public var apiKey: String {
        get { return self.apiKey }
        set(apiKey) { self.apiKey = apiKey }
    }
    
    static public var isDevelopment: Bool {
        get { return self.isDevelopment }
        set(isDevelopment) {
            if isDevelopment {
                self.baseUrl = NSURL(string: "http://devapi.jukebox.ninja/v1/search")!
            }
            
            self.isDevelopment = isDevelopment
        }
    }
}
