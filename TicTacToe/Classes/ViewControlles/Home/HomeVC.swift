//
//  HomeVC.swift
//  TicTacToe
//
//  Created by Subhranhu Sekhar Rout on 30/12/23.
//

import UIKit

class HomeVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func playBtnClick(_ sender: UIButton) {
        performSegue(withIdentifier: "GameVC", sender: nil)
    }
}
