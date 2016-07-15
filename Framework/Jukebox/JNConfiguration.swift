//
//  JNConfiguration.swift
//  Jukebox
//
//  Created by Jeremy Stucki on 02/07/2016.
//
//

import Foundation

public struct JNConfiguration {

    static private var _baseUrl: NSURL = NSURL(string: "https://api.jukebox.ninja/v1")!
    static private var _isDevelopment: Bool = false
    static public var apiKey: String = ""
    
    static public var baseUrl: NSURL {
        return self._baseUrl
    }
    
    static public var isDevelopment: Bool {
        get { return self._isDevelopment }
        
        set(isDevelopment) {
    
            if isDevelopment {
                self._baseUrl = NSURL(string: "http://devapi.jukebox.ninja/v1")!
            } else {
                self._baseUrl = NSURL(string: "https://api.jukebox.ninja/v1")!
            }
            
            self._isDevelopment = isDevelopment
        }
    }
}
