//
//  goldGeneral.swift
//  daishogi
//
//  Created by Zachary Abrahamson  on 3/27/24.
//

import Foundation

struct goldGeneral: Piece {
    var isWhite: Bool
    
    func calculateMoves() -> [Int] {
        return [1,2,3,45]
    }
    
    var pieceName: String = "金将"
    var pieceID: pieceTypes = .goldGeneral
    var promotesTo: Piece? {
        goldGeneral(isWhite: self.isWhite, isPromoted: true)
    }
    var isPromoted: Bool
    init(isWhite: Bool, isPromoted: Bool) {
        self.isWhite = isWhite
        self.isPromoted = isPromoted
    }
    
}
