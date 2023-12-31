//
//  HomeVC.swift
//  TicTacToe
//
//  Created by Subhranhu Sekhar Rout on 30/12/23.
//

import UIKit

enum PlayingMode {
    case player
    case computer
    
    var identifier: String {
        switch self {
            case .player: return "Multiplayer"
            case .computer: return "Single player"
        }
    }
}

class HomeVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let tag = sender as? Int {
            if let destinationVC = segue.destination as? GameVC {
                if tag == 0 {
                    destinationVC.playingMode = .player
                } else {
                    destinationVC.playingMode = .computer
                }
            }
        }
    }

    @IBAction func playBtnClick(_ sender: UIButton) {
        performSegue(withIdentifier: "GameVC", sender: sender.tag)
    }
    
    @IBAction func historyBtnClick(_ sender: Any) {
        performSegue(withIdentifier: "HistoryVC", sender: nil)
    }
    
}
