//
//  dragonHorse.swift
//  daishogi
//
//  Created by Zachary Abrahamson  on 3/28/24.
//

import Foundation

struct dragonHorse: Piece {
    func calculateMoves() -> [Int] {
        var counter = -1
        return Array(repeating: 0, count: 225).map { moo in
            counter += 1
            return counter
        }
    }
    
    var pieceName: String = "龍馬"
    var pieceID: pieceTypes = .dragonHorse
    var promotesTo: Piece? {
        hornedFalcon(isPromoted: true, isWhite: self.isWhite)
    }
    
    var isPromoted: Bool
    var isWhite: Bool
}
