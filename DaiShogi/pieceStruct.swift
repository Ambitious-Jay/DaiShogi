//
//  pieceStruct.swift
//  daishogi
//
//  Created by Zachary Abrahamson  on 3/23/24.
//

import Foundation
import SwiftUI

protocol Piece {
    var isWhite: Bool { get }
    var pieceID: pieceTypes { get }
    var promotesTo: Piece? { get }
    var isPromoted: Bool { get set }
    var pieceName: String { get }
    func calculateMoves() -> [Int]
}

extension Piece {
    var chipView: pieceLook {
        pieceLook(isPromoted: self.isPromoted, pieceName: self.pieceName)
    }
}

struct pieceLook: View {
    var isPromoted: Bool
    let pieceName: String
    var body: some View {
        UnevenRoundedRectangle(cornerRadii: RectangleCornerRadii(topLeading: 13, bottomLeading: 2, bottomTrailing: 2, topTrailing: 13), style: .circular)
            .fill(Color.darkBkg)
//            .shadow(radius: 5, x: 0.8, y: 0.9)
            .frame(width: 35, height: 45)
            .overlay {
                Text(pieceName)
                    .minimumScaleFactor(0.1)
                    .foregroundStyle(isPromoted ? .red : .black)
            }
    }
}
