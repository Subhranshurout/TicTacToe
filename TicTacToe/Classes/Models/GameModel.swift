//
//  GameModel.swift
//  TicTacToe
//
//  Created by Subhranhu Sekhar Rout on 27/12/23.
//

import Foundation

enum Player: String {
    case X = "X"
    case O = "O"
}

enum GameMode {
    case preparing
    case playing
    case finished
}

protocol ComputerModeDelegate: AnyObject {
    func computerMadeMove(at index: Int)
}

class TicTacToe {
    var board = [Player?](repeating: nil, count: 9)
    var currentPlayer: Player = .X
    var gamemode: GameMode = .preparing
    weak var computerDelegate: ComputerModeDelegate?

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
    func switchPlayer(playerMode: PlayingMode = .player) {
        if playerMode == .computer {
            computerDelegate?.computerMadeMove(at: makeComputerMove())
        }
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

    private func makeComputerMove() -> Int {
        // Check for a winning move for the computer
        if let winningMove = findWinningMove(for: currentPlayer) {
            return winningMove
        }

        // Check for a blocking move for the player
        if let blockingMove = findWinningMove(for: getOpponent(player: currentPlayer)) {
            return blockingMove
        }

        // If no winning or blocking move, make a random move
        let availableMoves = board.enumerated().filter { $0.element == nil }.map { $0.offset }
        guard !availableMoves.isEmpty else { return -1 }
        let randomIndex = Int(arc4random_uniform(UInt32(availableMoves.count)))
        return availableMoves[randomIndex]
    }

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
