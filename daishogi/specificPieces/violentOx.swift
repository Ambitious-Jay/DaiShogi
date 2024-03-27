//
//  violentOx.swift
//  daishogi
//
//  Created by Andrew Jo on 3/24/24.
//

import Foundation
import SwiftUI

//struct violentOx: Piece {
//    
//    var isWhite: Bool
//    var pieceID: Int
//    var position: Int
//    
//    init {
//        
//    }
//}

struct violentOx: Piece {
    var isWhite: Bool
    
    func calculateMoves() -> [Int] {
        return [1,2,3,45]
    }
    
    var pieceName: String = "猛牛"
    var pieceID: pieceTypes = .violentOx
    var chipView: any View
    init(isWhite: Bool) {
        self.isWhite = isWhite
        self.chipView = pieceLook(pieceName: self.pieceName)
    }
    
}
