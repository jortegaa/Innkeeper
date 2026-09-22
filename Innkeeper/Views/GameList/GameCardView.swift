//
//  GameCardView.swift
//  Innkeeper
//
//  Created by Jesús Ortega Ayala on 22/09/2026.
//

import SwiftUI

struct GameCardView: View {
    let game: Game
    var body: some View {
        VStack(spacing: 8) {
            GameCoverImage(imageData: game.coverImageData)
                .frame(width: 100, height: 100)
                .clipShape(RoundedRectangle(cornerRadius: 20))
            
            Text(game.name)
        }
    }
}

#Preview {
    GameCardView(game: .init(name: "Catan", minPlayers: 1, maxPlayers: 4))
}
