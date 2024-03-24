//
//  ContentView.swift
//  daishogi
//
//  Created by Zachary Abrahamson  on 3/13/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var boardstate = boardState()
    @State var board = [[0, 0, 0, 0, 0],[0, 0, 0, 0, 0],[0, 0, 0, 0, 0],[0, 0, 0, 0, 0]]
    var body: some View {
        chessBoard()
            .padding()
            .environmentObject(boardstate)
            
    }
}

#Preview {
    ContentView()
}
