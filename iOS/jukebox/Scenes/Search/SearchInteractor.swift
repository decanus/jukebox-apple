//
//  SearchInteractor.swift
//  jukebox
//
//  Created by Dean Eigenmann on 15/05/16.
//  Copyright © 2016 jukebox. All rights reserved.
//

import Foundation
import Alamofire
import JukeboxNinja

class SearchInteractor: NSObject, SearchViewControllerOutput {
    
    private let output: SearchInteractorOutput
    private var tracks: [Track] = []
    
    init(output: SearchInteractorOutput) {
        self.output = output
    }
    
    func searchForText(search: String) {
        
        if search == "" {
            return
        }
        
        let search = JNSearch()
        search.search(query: "sia") { (fuck) in
            print(fuck)
        }
        
        // @todo load tracks somewhere else, move this ugly shit

        
        output.presentTracks(tracks)
    }
    
}