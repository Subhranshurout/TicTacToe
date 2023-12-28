//
//  HomeVC.swift
//  TicTacToe
//
//  Created by Subhranhu Sekhar Rout on 26/12/23.
//

import UIKit

class HomeVC: ParentVC {
    
    var gameObj : TicTacToe!
    override func viewDidLoad() {
        super.viewDidLoad()
        gameObj = TicTacToe()
        prepareUI()
    }
    
    @IBAction func bnt(_ sender: UIButton) {
        myCollectionView.reloadData()
        myCollectionView.isUserInteractionEnabled = true
    }
    
    func prepareUI() {
        HomeCVC.prepareToRegister(sender: myCollectionView)
    }
}

extension HomeVC : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
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
                winnerCheck()
                
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
            updateUI(indexPath: indexPath)
        } else  {
            print("Alredy occupied")
        }
        if gameObj.isBoardFull() {
            print("Tie")
        }
    }
    
    func updateUI(indexPath : IndexPath) {
        myCollectionView.reloadItems(at: [indexPath])
    }
    
    func winnerCheck() {
        switch gameObj.checkForWinner() {
        case .O :
            print ("Player O wins")
            
        case .X :
            print("Player X wins")
            
        case .none :
            return
            
        }
        gameObj.resetGame()
        myCollectionView.isUserInteractionEnabled = false
        
    }
    
    
}
