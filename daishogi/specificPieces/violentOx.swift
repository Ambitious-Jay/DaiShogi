//
//  violentOx.swift
//  daishogi
//
//  Created by Andrew Jo on 3/24/24.
//

import Foundation

struct violentOx: Piece {
    func calculateMoves() -> [Int] {
        return [1,2,3,45]
    }
    
    var pieceName: String = "猛牛"
    var pieceID: pieceTypes = .violentOx
    var promotesTo: Piece? {
        goldGeneral(isPromoted: true, isWhite: self.isWhite)
    }
    
    var isPromoted: Bool
    var isWhite: Bool
}
