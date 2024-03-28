//
//  violentOx.swift
//  daishogi
//
//  Created by Andrew Jo on 3/24/24.
//

import Foundation

struct violentOx: Piece {
    var isWhite: Bool
    
    func calculateMoves() -> [Int] {
        return [1,2,3,45]
    }
    
    var pieceName: String = "猛牛"
    var pieceID: pieceTypes = .violentOx
    var promotesTo: Piece? {
        goldGeneral(isWhite: self.isWhite, isPromoted: true)
    }
    
    var isPromoted: Bool
    
    init(isWhite: Bool, isPromoted: Bool) {
        self.isWhite = isWhite
        self.isPromoted = isPromoted
    }
    
}
