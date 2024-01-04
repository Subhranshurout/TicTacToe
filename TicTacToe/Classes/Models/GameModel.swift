//
//  GameModel.swift
//  TicTacToe
//
//  Created by Subhranhu Sekhar Rout on 27/12/23.
//

import Foundation

//MARK: Player
enum Player: String {
    case X = "X"
    case O = "O"
}
//MARK: GameMode
enum GameMode {
    case preparing
    case playing
    case finished
}
//MARK: Computer move Protocol
protocol ComputerModeDelegate: AnyObject {
    func computerMadeMove(at index: Int)
}

class TicTacToe {
    
    //MARK: Variables:-
    var board = [Player?](repeating: nil, count: 9)
    var currentPlayer: Player = .X
    var gamemode: GameMode = .preparing
    
    //protocol delegate
    weak var computerDelegate: ComputerModeDelegate?
    
    ///To make a move
    func makeMove(at position: Int) -> Bool {
        guard position >= 0, position < board.count else {
            return false
        }
        board[position] = currentPlayer
        return true
    }
    
    ///To make a move
    func switchPlayer() {
        currentPlayer = (currentPlayer == .X) ? .O : .X
    }
    
    ///To switch b/w Players
    func switchPlayer(playerMode: PlayingMode = .player) {
        if playerMode == .computer {
            if !isBoardFull() {
                computerDelegate?.computerMadeMove(at: makeComputerMove())
            }
        }
    }
    
    ///To  cheak Winner
    func checkForWinner() -> Player? {
        if let winner = checkLines() ?? checkColumns() ?? checkDiagonals() {
            return winner
        }
        return nil
    }
    
    ///To cheak for Tie
    func isBoardFull() -> Bool {
        return !board.contains(nil)
    }

    //To Reset the game
    func resetGame() {
        print("Resetting the game")
        board = [Player?](repeating: nil, count: 9)
        currentPlayer = .X
        gamemode = .preparing
    }

    

    

}

//MARK: - Check Winning Moves
extension TicTacToe {
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

//MARK: - Automatic computer move
extension TicTacToe {
    private func makeComputerMove() -> Int {
        /// Check for a winning move for the computer
        if let winningMove = findWinningMove(for: currentPlayer) {
            return winningMove
        }

        /// Check for a blocking move for the player
        if let blockingMove = findWinningMove(for: getOpponent(player: currentPlayer)) {
            return blockingMove
        }

        /// If no winning or blocking move, make a random move
        let availableMoves = board.enumerated().filter { $0.element == nil }.map { $0.offset }
        guard !availableMoves.isEmpty else { return -1 }
        let randomIndex = Int(arc4random_uniform(UInt32(availableMoves.count)))
        return availableMoves[randomIndex]
    }

    //Findind winning move
    private func findWinningMove(for player: Player) -> Int? {
        for i in 0..<board.count {
            if board[i] == nil {
                board[i] = player
                if checkForWinner() == player {
                    board[i] = nil
                    return i
                }
                board[i] = nil
            }
        }
        return nil
    }

    private func getOpponent(player: Player) -> Player {
        return (player == .X) ? .O : .X
    }
}
