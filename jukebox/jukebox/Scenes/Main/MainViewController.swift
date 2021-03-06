//
//  MainViewController.swift
//  jukebox
//
//  Created by Dean Eigenmann on 09/05/16.
//  Copyright © 2016 jukebox. All rights reserved.
//

import UIKit
import AVFoundation

class MainViewController: UIViewController {

    private var player: Player!
    private var wasLoaded = false
    
    init(player: Player) {
        self.player = player
        
        super.init(nibName: nil, bundle: nil)
        
        tabBarItem.title = "Home"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UIApplication.sharedApplication().statusBarStyle = .Default

        navigationController?.navigationBarHidden = true
        view.backgroundColor = UIColor.whiteColor()

        if !wasLoaded {
            player.addToQueue(YoutubeTrack(id: "bpOSxM0rNPM", duration: 265, title: "Do I Wanna Know?"))
            player.addToQueue(YoutubeTrack(id: "QnxpHIl5Ynw", duration: 297, title: "High By The Beach"))
            player.addToQueue(YoutubeTrack(id: "jcF5HtGvX5I", duration: 122, title: "Yoncé"))
            player.addToQueue(YoutubeTrack(id: "JCT_lgJ5eq8", duration: 205))
            wasLoaded = true
        } 
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
