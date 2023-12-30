//
//  HomeVC.swift
//  TicTacToe
//
//  Created by Subhranhu Sekhar Rout on 26/12/23.
//

import UIKit

class GameVC: ParentVC, ComputerModeDelegate {
    func computerMadeMove(at index: Int) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.handleCellTap(at: IndexPath(row: index, section: 0))
            self.myCollectionView.isUserInteractionEnabled = true
        }
    }
    
    var gameObj : TicTacToe!
    var playingMode : PlayingMode = .computer
    @IBOutlet weak var winnerLbl: UILabel!
    @IBOutlet weak var greetingsLbl: UILabel!
    @IBOutlet weak var titleLbl: UILabel! {
        didSet {
            switch playingMode {
            case .player:
                titleLbl.text = "Multiplayer"
            case .computer:
                titleLbl.text = "Single Player"
            }
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gameObj = TicTacToe()
        prepareUI()
        
        if playingMode == .computer {
            gameObj.computerDelegate = self
        }
        
    }
    
    @IBAction func backBtn(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func playAgainBtnClick(_ sender: UIButton) {
        winnerLbl.isHidden = true
        greetingsLbl.isHidden = true
        
        myCollectionView.reloadData()
        myCollectionView.isUserInteractionEnabled = true
        gameObj.resetGame()
    }
    
    func prepareUI() {
        HomeCVC.prepareToRegister(sender: myCollectionView)
    }
}

extension GameVC : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return myCollectionView.dequeueReusableCell(withReuseIdentifier: "HomeCVC", for: indexPath) as! HomeCVC
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        let cell = cell as! HomeCVC
        if gameObj.gamemode == .playing {
            if gameObj.makeMove(at: indexPath.item) {
                cell.prepareUI(playerType: gameObj.currentPlayer)
                gameObj.switchPlayer()
                if playingMode == .computer  && gameObj.currentPlayer == .O {
                    gameObj.switchPlayer(playerMode: .computer)
                    myCollectionView.isUserInteractionEnabled = false
                }
                gameObj.gamemode = winnerCheck()
                
            }
        } else {
            cell.bgView.backgroundColor = UIColor.naturalLightGrey
            cell.bgView.borderColor = UIColor.naturalLightGrey
            cell.textLbl.text = nil
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width / 3 - 7, height: collectionView.frame.size.width / 3 - 7)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        handleCellTap(at: indexPath)
    }
    func handleCellTap(at indexPath: IndexPath) {
        if gameObj.gamemode == .preparing {
            gameObj.gamemode = .playing
        }
        if gameObj.board[indexPath.item] == nil {
            if gameObj.gamemode == .playing {
                updateUI(indexPath: indexPath)
            }
            
        } else  {
            print("Alredy occupied")
        }
        if gameObj.isBoardFull() {
            winnerLbl.isHidden = false
            greetingsLbl.isHidden = false
            
            winnerLbl.textColor = UIColor.black
            winnerLbl.text = "DRAW!"
            greetingsLbl.text = "It’s a draw"
            gameObj.gamemode = .finished
        }
    }
    
    func updateUI(indexPath : IndexPath) {
        myCollectionView.reloadItems(at: [indexPath])
    }
    
    func winnerCheck() -> GameMode {
        switch gameObj.checkForWinner() {
        case .O :
            print ("Player O wins")
            if playingMode == .computer {
                winnerLbl.text = "You Lost!"
                greetingsLbl.text = "Better luck next time.."
            }
            winnerLbl.textColor = UIColor.redV1
            
            winnerLbl.isHidden = false
            greetingsLbl.isHidden = false
            gameObj.resetGame()
            myCollectionView.isUserInteractionEnabled = false
            return .finished
            
        case .X :
            print("Player X wins")
            winnerLbl.text = "You Won!"
            greetingsLbl.text = "Congratulations"
            winnerLbl.textColor = UIColor.blueV1
            winnerLbl.isHidden = false
            greetingsLbl.isHidden = false
            gameObj.resetGame()
            myCollectionView.isUserInteractionEnabled = false
            return .finished
        case .none :
            return .playing
            
        }
        
        
    }
    
    
}
