//
//  JNArtist.swift
//  Jukebox
//
//  Created by Jeremy Stucki on 15/07/2016.
//
//

import Foundation

public protocol JNArtist: JNSearchResult {

    var id: Int { get }

    var name: String { get }

    var permalink: String { get }
}
