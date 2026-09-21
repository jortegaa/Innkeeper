//
//  GameListView.swift
//  Innkeeper
//
//  Created by Jesús Ortega Ayala on 21/09/2026.
//

import SwiftUI
import SwiftData

struct GameListView: View {
    @Query(sort: \Game.name) private var games: [Game]
    @Environment(\.modelContext) private var context

    var body: some View {
        NavigationStack {
            List(games) { game in
                NavigationLink(value: game) {
                    VStack(alignment: .leading) {
                        Text(game.name).font(.headline)
                        Text("\(game.minPlayers)–\(game.maxPlayers) jugadores")
                            .font(.caption)
                            .foregroundStyle(.secondary)
                    }
                }
            }
            .navigationDestination(for: Game.self) { game in
                GameDetailView(game: game)
            }
            .navigationTitle("Mis juegos")
            .toolbar {
                Button("Añadir") {
                    context.insert(Game(name: "Wingspan", minPlayers: 1, maxPlayers: 5, dateAdded: .now))
                }
            }
        }
    }
}
