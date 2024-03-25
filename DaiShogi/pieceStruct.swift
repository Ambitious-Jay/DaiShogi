//
//  pieceStruct.swift
//  daishogi
//
//  Created by Zachary Abrahamson  on 3/23/24.
//

import Foundation
import SwiftUI

protocol Piece {
    var isWhite: Bool { get set }
    var pieceID: Int { get set }
    var pieceName: String { get set }
    var position: Int { get set }
    
    var chipView: any View { get set }
    
    func calculateMoves()
    
    func movePiece(newSpot: Int)
}

extension Piece {
    func movePiece(newSpot: Int) {
//        self.position = newSpot
    }
    
//    var chipView =
}

struct tileLook: View {
    let tileName: String
    let style: RoundedCornerStyle
    var body: some View {
        UnevenRoundedRectangle(cornerRadii: RectangleCornerRadii(topLeading: 13, bottomLeading: 2, bottomTrailing: 2, topTrailing: 13), style: .circular)
            .fill(Color.darkBkg)
            .shadow(radius: 5, x: 0.8, y: 0.9)
            .frame(width: 35, height: 45)
            .overlay {
                Text(tileName)
                    .minimumScaleFactor(0.1)
                    .foregroundStyle(.black)
            }
    }
}
