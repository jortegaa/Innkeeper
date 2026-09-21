//
//  GameDetailView.swift
//  Innkeeper
//
//  Created by Jesús Ortega Ayala on 21/09/2026.
//

import SwiftUI
import SwiftData

struct GameDetailView: View {
    let game: Game
    @Environment(\.modelContext) private var context

    var body: some View {
        VStack(spacing: 16) {
            Text(game.name).font(.largeTitle)
            Text("Jugado \(game.matches.count) veces")
                .foregroundStyle(.secondary)

            Button("Registrar partida") {
                let match = Match(date: .now)
                context.insert(match)
                game.matches.append(match)
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }
}
