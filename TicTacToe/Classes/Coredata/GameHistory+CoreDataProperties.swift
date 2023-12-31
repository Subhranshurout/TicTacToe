//
//  GameHistory+CoreDataProperties.swift
//  TicTacToe
//
//  Created by Subhranhu Sekhar Rout on 30/12/23.
//
//

import Foundation
import CoreData


extension GameHistory {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<GameHistory> {
        return NSFetchRequest<GameHistory>(entityName: "GameHistory")
    }

    @NSManaged public var gameMode: String?
    @NSManaged public var winner: String?
    @NSManaged public var dateOp: String?
    @NSManaged public var timeOp: String?

}

extension GameHistory : Identifiable {

}
