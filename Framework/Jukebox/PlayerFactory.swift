//
//  PlayerFactory.swift
//  Jukebox
//
//  Created by Jeremy Stucki on 23/07/2016.
//
//

import Foundation

public class JNPlayerFactory {
    
    public static func createPlayer(forPlatform platform: JNPlatform) -> JNPlayer! {
        switch platform {
        case .YouTube:
            return JNYouTubePlayer()
        default:
            return nil
        }
    }
}
