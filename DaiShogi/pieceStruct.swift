//
//  pieceStruct.swift
//  daishogi
//
//  Created by Zachary Abrahamson  on 3/23/24.
//

import Foundation
import SwiftUI

protocol Piece {
//    var initialLocation: Int { get }
    var isWhite: Bool { get set }
    var pieceID: pieceTypes { get }
    var promotesTo: Piece? { get }
    var isPromoted: Bool { get set }
    var pieceName: String { get }
    func calculateMoves() -> [Int]
    init(isPromoted: Bool, isWhite: Bool)
    init(isWhite: Bool)
}

extension Piece {
    var chipView: pieceLook {
        pieceLook(isPromoted: self.isPromoted, pieceName: self.pieceName, isWhite: self.isWhite)
    }
    func array(count: Int) -> [Piece] {
        return Array(repeating: self, count: count)
    }
}

struct pieceLook: View {
    var isPromoted: Bool
    let pieceName: String
    let isWhite: Bool
    var body: some View {
        UnevenRoundedRectangle(cornerRadii: RectangleCornerRadii(topLeading: 13, bottomLeading: 2, bottomTrailing: 2, topTrailing: 13), style: .circular)
            .fill(Color.darkBkg)
//            .shadow(radius: 5, x: 0.8, y: 0.9)
            .frame(width: 35, height: 45)
//            .border(Color.black, width: 0.5)
            .overlay {
                UnevenRoundedRectangle(cornerRadii: RectangleCornerRadii(topLeading: 13, bottomLeading: 2, bottomTrailing: 2, topTrailing: 13), style: .circular)
                    .stroke(Color.black, lineWidth: 1)
                    .overlay {
                        Text(pieceName)
                            .minimumScaleFactor(0.1)
                            .foregroundStyle(isPromoted ? .red : .black)
                    }
            }
            .rotationEffect(.radians(isWhite ? .pi : 0.0))
    }
}
