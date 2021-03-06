//
//  ViewController.swift
//  El Rincon de Chiquito
//
//  Created by Diego on 23/12/17.
//  Copyright © 2017 Quijote@pps. All rights reserved.
//

import UIKit
import GoogleMobileAds

class MenuViewController: UIViewController {

    // Outlets
    
    @IBOutlet weak var banner: GADBannerView!
    
    // Actions
    
    @IBAction func buttonSonidos(_ sender: Any) {
        self.performSegue(withIdentifier: "menu2ChistesSonidos", sender: sender)
    }
    
    @IBAction func buttonChistes(_ sender: Any) {
        self.performSegue(withIdentifier: "menu2ChistesSonidos", sender: sender)
    }
    
    @IBAction func buttonVideos(_ sender: Any) {
        self.performSegue(withIdentifier: "menu2ChistesSonidos", sender: sender)
    }
    
    // Metodos del ViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Para que aparezca la pantalla de inicio durante 3 segundos al menos
        self.banner.adUnitID = "ca-app-pub-9225943803373012/8313481820"
        self.banner.rootViewController = self
        let request = GADRequest()
        request.testDevices = [kGADSimulatorID]
        self.banner.load(request)
        
//        sleep(3)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if segue.identifier == "menu2ChistesSonidos" {
            
            let boton = sender as! UIButton
            
            let objSonidosView : SonidosViewController = segue.destination as! SonidosViewController
        
            objSonidosView.menuChoice = 0
            
            if boton.titleLabel?.text == "Sonidos" {
                objSonidosView.menuChoice = 1
            }
            else if boton.titleLabel?.text == "Chistes" {
                objSonidosView.menuChoice = 2
            }
            else if boton.titleLabel?.text == "Videos" {
                objSonidosView.menuChoice = 3
            }

        }
    }
    
    // Funciones privadas
    
}

