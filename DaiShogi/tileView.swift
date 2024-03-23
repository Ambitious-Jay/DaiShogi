//
//  TileView.swift
//  daishogi
//
//  Created by Zachary Abrahamson  on 3/21/24.
//

import SwiftUI

extension Color {
    static let beigie: Color = Color(red: 248/255, green: 228/255, blue: 172/255, opacity: 1.0)
    static let darkBkg: Color = Color(red: 250/255, green: 190/255, blue: 160/255)
}

struct tileView: View {
    let widthHeight = 50.0
    let position: (row: Int, col: Int)
    var body: some View {
        VStack {
            Rectangle()
                .foregroundStyle(Color.beigie)
                .frame(width: widthHeight, height: widthHeight)
        }
    }
    var numberRow: some View {
        Text("\(position.row)")
            .frame(width: widthHeight, height: widthHeight)
    }
    var numberCol: some View {
        Text("\(position.col)" != "16" ? "\(position.col)" : " ")
            .frame(width: widthHeight, height: widthHeight)
    }
}

#Preview {
    tileView(position: (0, 0))
}
