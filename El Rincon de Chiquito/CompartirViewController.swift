//
//  CompartirViewController.swift
//  El Rincon de Chiquito
//
//  Created by Diego on 27/12/17.
//  Copyright © 2017 Quijote@pps. All rights reserved.
//

import UIKit

class CompartirViewController: UIViewController {

    @IBAction func botonCompartir(_ sender: Any) {
        // text to share
        let text = "https://play.google.com/store/apps/details?id=com.quijoteapps.elrincondechiquito&hl=es"
        
        // set up activity view controller
        let textToShare = [ text ]
        let activityViewController = UIActivityViewController(activityItems: textToShare, applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = self.view // so that iPads won't crash
        
        // exclude some activity types from the list (optional)
        activityViewController.excludedActivityTypes = [ UIActivityType.airDrop, UIActivityType.postToFacebook ]
        
        // present the view controller
        self.present(activityViewController, animated: true, completion: nil)
        
    }
    
    @IBAction func botonURL(_ sender: Any) {
        if let url = URL(string: "http://www.quijoteapps.com") {
            UIApplication.shared.open(url)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
