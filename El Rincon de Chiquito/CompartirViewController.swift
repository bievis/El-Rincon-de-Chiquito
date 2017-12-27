//
//  CompartirViewController.swift
//  El Rincon de Chiquito
//
//  Created by Diego on 27/12/17.
//  Copyright © 2017 Quijote@pps. All rights reserved.
//

import UIKit

class CompartirViewController: UIViewController {

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
