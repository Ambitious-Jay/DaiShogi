//
//  goldGeneral.swift
//  daishogi
//
//  Created by Zachary Abrahamson  on 3/27/24.
//

import Foundation

struct goldGeneral: Piece {
    func calculateMoves() -> [Int] {
        return [1,2,3,45]
    }
    
    var pieceName: String = "金将"
    var pieceID: pieceTypes = .goldGeneral
    var promotesTo: Piece? {
        goldGeneral(isPromoted: true, isWhite: self.isWhite)
    }
    
    var isPromoted: Bool
    var isWhite: Bool
}
