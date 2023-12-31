//
//  gameHistoryTVC.swift
//  TicTacToe
//
//  Created by Subhranhu Sekhar Rout on 31/12/23.
//

import UIKit

class GameHistoryTVC: UITableViewCell {

    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var gameModeLbl: UILabel!
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var timeLbl: UILabel!
    @IBOutlet weak var winnerLbl: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func prepareUI(game : GameHistory) {
        gameModeLbl.text = game.gameMode
        dateLbl.text = game.dateOp
        timeLbl.text = game.timeOp
        winnerLbl.text = game.winner
        
        if winnerLbl.text == "X" || winnerLbl.text == "You" {
            winnerLbl.textColor = UIColor.blueV1
        } else {
            winnerLbl.textColor = UIColor.redV1
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension GameHistoryTVC {
    class func prepareToRegister(_ sender : UITableView) {
        sender.register(UINib(nibName: "GameHistoryTVC", bundle: nil), forCellReuseIdentifier: "GameHistoryTVC")
    }
}
