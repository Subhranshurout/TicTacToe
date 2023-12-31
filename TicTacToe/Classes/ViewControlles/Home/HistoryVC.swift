//
//  HistoryVC.swift
//  TicTacToe
//
//  Created by Subhranhu Sekhar Rout on 31/12/23.
//

import UIKit
import CoreData

class HistoryVC: ParentVC {

    var gameHistoryList = [GameHistory]()
    override func viewDidLoad() {
        super.viewDidLoad()
        GameHistoryTVC.prepareToRegister(myTableView)
        gameHistoryList = fetchGameHistory()
        myTableView.reloadData()
    }
    func fetchGameHistory() -> [GameHistory] {
        do {
            guard let result = try _appDelegator.context.fetch(GameHistory.fetchRequest()) as? [GameHistory] else { return [] }

            print("Data fetched from CoreData")
            return result
        } catch let error {
            debugPrint(error)
        }
        return []
    }

    
    
}
extension HistoryVC : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gameHistoryList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return myTableView.dequeueReusableCell(withIdentifier: "GameHistoryTVC", for: indexPath)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let cell = cell as! GameHistoryTVC
        cell.prepareUI(game: gameHistoryList[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = myTableView.dequeueReusableCell(withIdentifier: "HeaderView")
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 55
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 55
    }
}
