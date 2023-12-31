//
//  ParentVC.swift
//  TicTacToe
//
//  Created by Subhranhu Sekhar Rout on 25/12/23.
//

import UIKit

class ParentVC: UIViewController {

    //MARK: - Outlets
    @IBOutlet weak var myCollectionView: UICollectionView!
    @IBOutlet weak var myTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func backBtn(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }


}
