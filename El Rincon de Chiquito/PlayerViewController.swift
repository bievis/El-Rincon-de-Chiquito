//
//  PlayerViewController.swift
//  El Rincon de Chiquito
//
//  Created by Diego on 27/12/17.
//  Copyright © 2017 Quijote@pps. All rights reserved.
//

import UIKit

class PlayerViewController: UIViewController {

    @IBOutlet weak var youtubePlayer: YTPlayerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        youtubePlayer.load(withVideoId: "h-b6NhNKP7k")
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
