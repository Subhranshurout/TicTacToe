//
//  gameHistoryTVC.swift
//  TicTacToe
//
//  Created by Subhranhu Sekhar Rout on 31/12/23.
//

import UIKit

class GameHistoryTVC: UITableViewCell {

    //MARK: Outlets:-
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var gameModeLbl: UILabel!
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var timeLbl: UILabel!
    @IBOutlet weak var winnerLbl: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    //Prepare cell UI according to the GameHistory data
    func prepareUI(game : GameHistory) {
        gameModeLbl.text = game.gameMode
        dateLbl.text = game.dateOp
        timeLbl.text = game.timeOp
        winnerLbl.text = game.winner
        
        if winnerLbl.text == "X" || winnerLbl.text == "You" {
            winnerLbl.textColor = UIColor.blueV1
        } else if winnerLbl.text == "Draw!"{
            winnerLbl.textColor = UIColor.green
        } else {
            winnerLbl.textColor = UIColor.redV1
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
}
//Register Nib for  TableView :
extension GameHistoryTVC {
    class func prepareToRegister(_ sender : UITableView) {
        sender.register(UINib(nibName: "GameHistoryTVC", bundle: nil), forCellReuseIdentifier: "GameHistoryTVC")
    }
}
