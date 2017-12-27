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

    var myKeys: Array<String> = []
    var localPlayer: AVQueuePlayer?
    var menuChoice: Int?
    
    let sounds: [String:String] = [
        "ChiquitoJapyNeuYeissss":"http://www.quijoteapps.com/appchiquito/SONIDOS/ChiquitoJapyNeuYeissss.mp3",
        "acomisarida":"http://www.quijoteapps.com/appchiquito/SONIDOS/acomisarida.mp3",
        "aguaagua":"http://www.quijoteapps.com/appchiquito/SONIDOS/aguaagua.mp3",
        "ahorarrr":"http://www.quijoteapps.com/appchiquito/SONIDOS/ahorarrr.mp3",
        "aiiiiii":"http://www.quijoteapps.com/appchiquito/SONIDOS/aiiiiii.mp3",
        "ajanderborekan":"http://www.quijoteapps.com/appchiquito/SONIDOS/ajanderborekan.mp3",
        "alataquerrr":"http://www.quijoteapps.com/appchiquito/SONIDOS/alataquerrr.mp3",
        "amatomacerebro":"http://www.quijoteapps.com/appchiquito/SONIDOS/amatomacerebro.mp3",
        "amatomadentro":"http://www.quijoteapps.com/appchiquito/SONIDOS/amatomadentro.mp3",
        "amatomagrande":"http://www.quijoteapps.com/appchiquito/SONIDOS/amatomagrande.mp3",
        "animalesbravidos":"http://www.quijoteapps.com/appchiquito/SONIDOS/animalesbravidos.mp3",
        "antesdemorirme":"http://www.quijoteapps.com/appchiquito/SONIDOS/antesdemorirme.mp3",
        "apitican":"http://www.quijoteapps.com/appchiquito/SONIDOS/apitican.mp3",
        "aquevieneeso":"http://www.quijoteapps.com/appchiquito/SONIDOS/aquevieneeso.mp3",
        "arejarrrr":"http://www.quijoteapps.com/appchiquito/SONIDOS/arejarrrr.mp3",
        "caballobonanza":"http://www.quijoteapps.com/appchiquito/SONIDOS/caballobonanza.mp3",
        "cacheosexual":"http://www.quijoteapps.com/appchiquito/SONIDOS/cacheosexual.mp3",
        "camarerorrrr":"http://www.quijoteapps.com/appchiquito/SONIDOS/camarerorrrr.mp3",
        "cantantesexual":"http://www.quijoteapps.com/appchiquito/SONIDOS/cantantesexual.mp3",
        "cante":"http://www.quijoteapps.com/appchiquito/SONIDOS/cante.mp3",
        "cobarde":"http://www.quijoteapps.com/appchiquito/SONIDOS/cobarde.mp3",
        "cobardepecador":"http://www.quijoteapps.com/appchiquito/SONIDOS/cobardepecador.mp3",
        "cocacola":"http://www.quijoteapps.com/appchiquito/SONIDOS/cocacola.mp3",
        "cogedlo":"http://www.quijoteapps.com/appchiquito/SONIDOS/cogedlo.mp3",
        "comidoropero":"http://www.quijoteapps.com/appchiquito/SONIDOS/comidoropero.mp3",
        "comorrr":"http://www.quijoteapps.com/appchiquito/SONIDOS/comorrr.mp3",
        "cuerpohumano":"http://www.quijoteapps.com/appchiquito/SONIDOS/cuerpohumano.mp3",
        "cuerposexual":"http://www.quijoteapps.com/appchiquito/SONIDOS/cuerposexual.mp3",
        "cuidadin":"http://www.quijoteapps.com/appchiquito/SONIDOS/cuidadin.mp3",
        "diodenaldepersona":"http://www.quijoteapps.com/appchiquito/SONIDOS/diodenaldepersona.mp3",
        "diodenardepersonahumana":"http://www.quijoteapps.com/appchiquito/SONIDOS/diodenardepersonahumana.mp3",
        "diodenarrrr":"http://www.quijoteapps.com/appchiquito/SONIDOS/diodenarrrr.mp3",
        "diodenovaginal":"http://www.quijoteapps.com/appchiquito/SONIDOS/diodenovaginal.mp3",
        "dondestamaria":"http://www.quijoteapps.com/appchiquito/SONIDOS/dondestamaria.mp3",
        "dortorgrijando":"http://www.quijoteapps.com/appchiquito/SONIDOS/dortorgrijando.mp3",
        "erquicio":"http://www.quijoteapps.com/appchiquito/SONIDOS/erquicio.mp3",
        "estoyanosalepana":"http://www.quijoteapps.com/appchiquito/SONIDOS/estoyanosalepana.mp3",
        "euancandemor":"http://www.quijoteapps.com/appchiquito/SONIDOS/euancandemor.mp3",
        "eusteduntorpedo":"http://www.quijoteapps.com/appchiquito/SONIDOS/eusteduntorpedo.mp3",
        "evalekan":"http://www.quijoteapps.com/appchiquito/SONIDOS/evalekan.mp3",
        "federico":"http://www.quijoteapps.com/appchiquito/SONIDOS/federico.mp3",
        "fistro":"http://www.quijoteapps.com/appchiquito/SONIDOS/fistro.mp3",
        "fistrodeabajo":"http://www.quijoteapps.com/appchiquito/SONIDOS/fistrodeabajo.mp3",
        "fistrodeanimal":"http://www.quijoteapps.com/appchiquito/SONIDOS/fistrodeanimal.mp3",
        "fistrodeoreja":"http://www.quijoteapps.com/appchiquito/SONIDOS/fistrodeoreja.mp3",
        "fistrodiodenalregalo":"http://www.quijoteapps.com/appchiquito/SONIDOS/fistrodiodenalregalo.mp3",
        "fistrohombremalo":"http://www.quijoteapps.com/appchiquito/SONIDOS/fistrohombremalo.mp3",
        "fuegor":"http://www.quijoteapps.com/appchiquito/SONIDOS/fuegor.mp3",
        "gastardiinero":"http://www.quijoteapps.com/appchiquito/SONIDOS/gastardiinero.mp3",
        "gloriademipadre":"http://www.quijoteapps.com/appchiquito/SONIDOS/gloriademipadre.mp3",
        "grijandermenemore":"http://www.quijoteapps.com/appchiquito/SONIDOS/grijandermenemore.mp3",
        "guarreridafistrovaginal":"http://www.quijoteapps.com/appchiquito/SONIDOS/guarreridafistrovaginal.mp3",
        "guarrrhhh":"http://www.quijoteapps.com/appchiquito/SONIDOS/guarrrhhh.mp3",
        "hahechouddecorrermeneterica":"http://www.quijoteapps.com/appchiquito/SONIDOS/hahechouddecorrermeneterica.mp3",
        "hombremalopradera":"http://www.quijoteapps.com/appchiquito/SONIDOS/hombremalopradera.mp3",
        "igualquetolmundo":"http://www.quijoteapps.com/appchiquito/SONIDOS/igualquetolmundo.mp3",
        "ioputa":"http://www.quijoteapps.com/appchiquito/SONIDOS/ioputa.mp3",
        "ladronsexual":"http://www.quijoteapps.com/appchiquito/SONIDOS/ladronsexual.mp3",
        "malauao":"http://www.quijoteapps.com/appchiquito/SONIDOS/malauao.mp3",
        "manuel":"http://www.quijoteapps.com/appchiquito/SONIDOS/manuel.mp3",
        "mecagoentotusmuelas":"http://www.quijoteapps.com/appchiquito/SONIDOS/mecagoentotusmuelas.mp3",
        "mejondeespaña":"http://www.quijoteapps.com/appchiquito/SONIDOS/mejondeespa%C3%B1a.mp3",
        "monedaespañola":"http://www.quijoteapps.com/appchiquito/SONIDOS/monedaespa%C3%B1ola.mp3",
        "morenau":"http://www.quijoteapps.com/appchiquito/SONIDOS/morenau.mp3",
        "naciodespuesdolores":"http://www.quijoteapps.com/appchiquito/SONIDOS/naciodespuesdolores.mp3",
        "negrooo":"http://www.quijoteapps.com/appchiquito/SONIDOS/negrooo.mp3",
        "nocanteustedmas":"http://www.quijoteapps.com/appchiquito/SONIDOS/nocanteustedmas.mp3",
        "nopuedeser":"http://www.quijoteapps.com/appchiquito/SONIDOS/nopuedeser.mp3",
        "nopuedo":"http://www.quijoteapps.com/appchiquito/SONIDOS/nopuedo.mp3",
        "nor":"http://www.quijoteapps.com/appchiquito/SONIDOS/nor.mp3",
        "notedaverguenza":"http://www.quijoteapps.com/appchiquito/SONIDOS/notedaverguenza.mp3",
        "oleole":"http://www.quijoteapps.com/appchiquito/SONIDOS/oleole.mp3",
        "orejasgrandes":"http://www.quijoteapps.com/appchiquito/SONIDOS/orejasgrandes.mp3",
        "orjae":"http://www.quijoteapps.com/appchiquito/SONIDOS/orjae.mp3",
        "partirdiodeno":"http://www.quijoteapps.com/appchiquito/SONIDOS/partirdiodeno.mp3",
        "pecador":"http://www.quijoteapps.com/appchiquito/SONIDOS/pecador.mp3",
        "pecadordelapradera":"http://www.quijoteapps.com/appchiquito/SONIDOS/pecadordelapradera.mp3",
        "pelotaso":"http://www.quijoteapps.com/appchiquito/SONIDOS/pelotaso.mp3",
        "porlagloriadetupadre":"http://www.quijoteapps.com/appchiquito/SONIDOS/porlagloriadetupadre.mp3",
        "quepasa":"http://www.quijoteapps.com/appchiquito/SONIDOS/quepasa.mp3",
        "quietorr":"http://www.quijoteapps.com/appchiquito/SONIDOS/quietorr.mp3",
        "relajaseusted":"http://www.quijoteapps.com/appchiquito/SONIDOS/relajaseusted.mp3",
        "sastretarzan":"http://www.quijoteapps.com/appchiquito/SONIDOS/sastretarzan.mp3",
        "soyunpecador":"http://www.quijoteapps.com/appchiquito/SONIDOS/soyunpecador.mp3",
        "sueñodenoche":"http://www.quijoteapps.com/appchiquito/SONIDOS/sue%C3%B1odenoche.mp3",
        "tedacuen":"http://www.quijoteapps.com/appchiquito/SONIDOS/tedacuen.mp3",
        "temuevemasquelosprecios":"http://www.quijoteapps.com/appchiquito/SONIDOS/temuevemasquelosprecios.mp3",
        "torpedoanisdelmono":"http://www.quijoteapps.com/appchiquito/SONIDOS/torpedoanisdelmono.mp3",
        "trigorodrigo":"http://www.quijoteapps.com/appchiquito/SONIDOS/trigorodrigo.mp3",
        "tumujersexual":"http://www.quijoteapps.com/appchiquito/SONIDOS/tumujersexual.mp3",
        "ustedsemea":"http://www.quijoteapps.com/appchiquito/SONIDOS/ustedsemea.mp3",
        "visionsexual":"http://www.quijoteapps.com/appchiquito/SONIDOS/visionsexual.mp3",
        "yaireaverlo":"http://www.quijoteapps.com/appchiquito/SONIDOS/yaireaverlo.mp3",
        "yocanto":"http://www.quijoteapps.com/appchiquito/SONIDOS/yocanto.mp3" ]
    
    let chistes: [String:String] = [
        "5duros":"http://www.quijoteapps.com/appchiquito/CHISTES%20INDIVIDUALES/5duros.mp3",
        "abrigobison":"http://www.quijoteapps.com/appchiquito/CHISTES%20INDIVIDUALES/abrigobison.mp3",
        "borrachocantando":"http://www.quijoteapps.com/appchiquito/CHISTES%20INDIVIDUALES/borrachocantando.mp3",
        "borrachocoche":"http://www.quijoteapps.com/appchiquito/CHISTES%20INDIVIDUALES/borrachocoche.mp3",
        "carteros":"http://www.quijoteapps.com/appchiquito/CHISTES%20INDIVIDUALES/carteros.mp3",
        "circo":"http://www.quijoteapps.com/appchiquito/CHISTES%20INDIVIDUALES/circo.mp3",
        "cuernosbloque":"http://www.quijoteapps.com/appchiquito/CHISTES%20INDIVIDUALES/cuernosbloque.mp3",
        "doshermanas":"http://www.quijoteapps.com/appchiquito/CHISTES%20INDIVIDUALES/doshermanas.mp3",
        "flojocobarde":"http://www.quijoteapps.com/appchiquito/CHISTES%20INDIVIDUALES/flojocobarde.mp3",
        "hombremayor":"http://www.quijoteapps.com/appchiquito/CHISTES%20INDIVIDUALES/hombremayor.mp3",
        "judio":"http://www.quijoteapps.com/appchiquito/CHISTES%20INDIVIDUALES/judio.mp3",
        "mariquitaagua":"http://www.quijoteapps.com/appchiquito/CHISTES%20INDIVIDUALES/mariquitaagua.mp3",
        "mariquitas":"http://www.quijoteapps.com/appchiquito/CHISTES%20INDIVIDUALES/mariquitas.mp3",
        "mariquitasleones":"http://www.quijoteapps.com/appchiquito/CHISTES%20INDIVIDUALES/mariquitasleones.mp3",
        "mariquitasuicida":"http://www.quijoteapps.com/appchiquito/CHISTES%20INDIVIDUALES/mariquitasuicida.mp3",
        "niñoalemania":"http://www.quijoteapps.com/appchiquito/CHISTES%20INDIVIDUALES/ni%C3%B1oalemania.mp3",
        "padreborracho":"http://www.quijoteapps.com/appchiquito/CHISTES%20INDIVIDUALES/padreborracho.mp3",
        "pareja":"http://www.quijoteapps.com/appchiquito/CHISTES%20INDIVIDUALES/pareja.mp3",
        "parejacama":"http://www.quijoteapps.com/appchiquito/CHISTES%20INDIVIDUALES/parejacama.mp3",
        "taxista":"http://www.quijoteapps.com/appchiquito/CHISTES%20INDIVIDUALES/taxista.mp3",
        "teresa":"http://www.quijoteapps.com/appchiquito/CHISTES%20INDIVIDUALES/teresa.mp3" ]

    // Outlets
    
    @IBOutlet weak var imgPrincipal: UIImageView!
    @IBOutlet weak var tabla: UITableView!
    @IBOutlet weak var banner: UIImageView!
    
    // Metodos del ViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tabla.dataSource = self
        tabla.delegate = self
        
        cargaContenidos(tipo: menuChoice!)
        
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
        
        return myKeys.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let celda = UITableViewCell(style:UITableViewCellStyle.default,reuseIdentifier:"Cell")
        celda.textLabel?.text = myKeys[indexPath.row]
        if menuChoice == 1 {
            celda.imageView!.image = UIImage(named: "risa_1.png")
        }
        else {
            celda.imageView!.image = UIImage(named: "risa_3.png")
        }
        return celda
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print(sounds[myKeys[indexPath.row]] ?? "out of range")
        
//        let urlstring = "http://radio.spainmedia.es/wp-content/uploads/2015/12/tailtoddle_lo4.mp3"

        var urlStr: String = ""
        
        if menuChoice == 1 {
            urlStr = sounds[myKeys[indexPath.row]]!
        }
        else {
            urlStr = chistes[myKeys[indexPath.row]]!
        }
        
        let url = URL(string: urlStr)
//        print("the url = \(url!)")

        queueMP3(url: url!)
        
    }
    
    // Metodos privados
    
    func queueMP3(url: URL) {

        self.localPlayer!.removeAllItems()
        
        let playerItem = AVPlayerItem.init(url: url)
        
        self.localPlayer!.insert(playerItem, after: nil)
        self.localPlayer!.play()
        
    }
    
    func cargaContenidos(tipo: Int) {
        
        if menuChoice == 1 {
            imgPrincipal.image = UIImage(named: "Chiquitazo_fistro.png")

            myKeys = Array(sounds.keys)
        }
        else {
            imgPrincipal.image = UIImage(named: "Chiquitazo_comorrr.png")
            
            myKeys = Array(chistes.keys)
        }
        
    }
}
