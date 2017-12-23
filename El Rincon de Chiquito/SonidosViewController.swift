//
//  SonidosControllerViewController.swift
//  El Rincon de Chiquito
//
//  Created by Diego on 23/12/17.
//  Copyright © 2017 Quijote@pps. All rights reserved.
//

import UIKit
import AVFoundation

class SonidosViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
 {
    let sounds: [String:String] = [
        "texto1":"http://prueba.com",
        "texto2":"http://otraprueba.com",
        "texto3":"http://otraprueba2.com",
        "texto4":"http://otraprueba3.com"]
    var myKeys: Array<String> = []
    var localPlayer: AVQueuePlayer?
    
    // Outlets
    
    @IBOutlet var tabla: UITableView!
    
    // Metodos del ViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tabla.dataSource = self
        tabla.delegate = self
        
        myKeys = Array(sounds.keys)
        
        localPlayer = AVQueuePlayer.init()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }

    // Metodos del TableView
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sounds.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let celda = UITableViewCell(style:UITableViewCellStyle.default,reuseIdentifier:"Cell")
        celda.textLabel?.text = myKeys[indexPath.row]
        celda.imageView!.image = UIImage(named: "sonido.png")
        
        return celda
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(sounds[myKeys[indexPath.row]] ?? "out of range")
        
        let urlstring = "http://radio.spainmedia.es/wp-content/uploads/2015/12/tailtoddle_lo4.mp3"

        let url = URL(string: urlstring)
        print("the url = \(url!)")

        queueMP3(url: url!)
        
    }
    
    // Metodos privados
    
    func queueMP3(url: URL) {

        self.localPlayer!.removeAllItems()
        
        let playerItem = AVPlayerItem.init(url: url)
        
        self.localPlayer!.insert(playerItem, after: nil)
        self.localPlayer!.play()
        
    }
}
