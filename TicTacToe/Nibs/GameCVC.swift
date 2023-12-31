//
//  HomeCVC.swift
//  TicTacToe
//
//  Created by Subhranhu Sekhar Rout on 26/12/23.
//

import UIKit

class GameCVC: UICollectionViewCell {

    // MARK: Outlets:-
    @IBOutlet weak var textLbl: UILabel!
    @IBOutlet weak var bgView: RoundView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        ///For shadow of the cell
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOpacity = 0.3
        self.layer.shadowOffset = CGSize(width: -2, height: 2)
        self.layer.shadowRadius = 2
        self.layer.shouldRasterize = true
        
    }
    //Prepare cell UI according to the player
    func prepareUI (playerType : Player) {
        switch playerType {
        case .X:
            bgView.backgroundColor = UIColor.blueV2
            bgView.borderColor = UIColor.blueV1
            bgView.borderWidth = 1
            textLbl.text = playerType.rawValue
            textLbl.textColor = UIColor.blueV1
        case .O:
            bgView.backgroundColor = UIColor.redV2
            bgView.borderColor = UIColor.redV1
            bgView.borderWidth = 1
            textLbl.text = playerType.rawValue
            textLbl.textColor = UIColor.redV1
        }
    }

}
//Register Nib for  TableView :
extension GameCVC {
    static func prepareToRegister(sender : UICollectionView) {
        sender.register(UINib(nibName: "GameCVC", bundle: nil), forCellWithReuseIdentifier: "GameCVC")
    }
}
