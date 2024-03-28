//
//  violentOx.swift
//  daishogi
//
//  Created by Andrew Jo on 3/24/24.
//

import Foundation

struct violentOx: Piece {
    func calculateMoves() -> [Int] {
        var counter = -1
        return Array(repeating: 0, count: 225).map { moo in
            counter += 1
            return counter
        }
    }
    
    var pieceName: String = "猛牛"
    var pieceID: pieceTypes = .violentOx
    var promotesTo: Piece? {
        goldGeneral(isPromoted: true, isWhite: self.isWhite)
    }
    
    var isPromoted: Bool
    var isWhite: Bool
}
