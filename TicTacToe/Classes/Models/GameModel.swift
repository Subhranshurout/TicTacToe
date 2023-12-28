//
//  GameModel.swift
//  TicTacToe
//
//  Created by Subhranhu Sekhar Rout on 27/12/23.
//

import Foundation
import UIKit

enum Player: String {
    case X = "X"
    case O = "O"
}

enum GameMode {
    case preparing
    case playing
}

class TicTacToe {
    var board = [Player?](repeating: nil, count: 9)
    var currentPlayer: Player = .X
    var gamemode : GameMode = .preparing
    
    func makeMove(at position: Int) -> Bool {
        
        guard position >= 0, position < board.count else {
            return false
        }
        
        board[position] = currentPlayer
        return true
    }
    
    func switchPlayer() {
        currentPlayer = (currentPlayer == .X) ? .O : .X
    }
    
    
    func checkForWinner() -> Player? {
        if let winner = checkLines() ?? checkColumns() ?? checkDiagonals() {
            return winner
        }
        return nil
    }
    
    func isBoardFull() -> Bool {
        return !board.contains(nil)
    }
    
    func resetGame() {
        print("Resetting the game")
        board = [Player?](repeating: nil, count: 9)
        currentPlayer = .X
        gamemode = .preparing
    }
    
    private func checkLines() -> Player? {
        for i in stride(from: 0, to: 9, by: 3) {
            if let player = board[i], player == board[i + 1], player == board[i + 2] {
                return player
            }
        }
        return nil
    }
    
    private func checkColumns() -> Player? {
        for i in 0..<3 {
            if let player = board[i], player == board[i + 3], player == board[i + 6] {
                return player
            }
        }
        return nil
    }
    
    private func checkDiagonals() -> Player? {
        if let player = board[0], player == board[4], player == board[8] {
            return player
        }
        if let player = board[2], player == board[4], player == board[6] {
            return player
        }
        return nil
    }
}
