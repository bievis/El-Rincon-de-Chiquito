//
//  PlayerViewController.swift
//  El Rincon de Chiquito
//
//  Created by Diego on 27/12/17.
//  Copyright © 2017 Quijote@pps. All rights reserved.
//

import UIKit
import GoogleMobileAds

class PlayerViewController: UIViewController {

    @IBOutlet weak var youtubePlayer: YTPlayerView!
    @IBOutlet weak var banner: GADBannerView!
    
    var videoHASH: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Player"
        
        self.banner.adUnitID = "ca-app-pub-9225943803373012/8313481820"
        self.banner.rootViewController = self
        let request = GADRequest()
        request.testDevices?.append(kGADSimulatorID)
        self.banner.load(request)
        
        youtubePlayer.load(withVideoId: videoHASH!)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }

}
