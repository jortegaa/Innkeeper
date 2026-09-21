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
    @State var showingAddGame: Bool = false
    
    var body: some View {
        NavigationStack {
            List(games) { game in
                NavigationLink(value: game) {
                    HStack(spacing: 12) {
                        coverImage(for: game)
                            .frame(width: 50, height: 50)
                            .clipShape(RoundedRectangle(cornerRadius: 8))

                        VStack(alignment: .leading) {
                            Text(game.name).font(.headline)
                            Text("\(game.minPlayers)–\(game.maxPlayers) jugadores")
                                .font(.caption)
                                .foregroundStyle(.secondary)
                        }
                    }
                }
            }
            .navigationDestination(for: Game.self) { game in
                GameDetailView(game: game)
            }
            .navigationTitle("Mis juegos")
            .toolbar {
                Button { showingAddGame = true } label: {
                    Label("Añadir", systemImage: "plus")
                }
            }
            .sheet(isPresented: $showingAddGame) {
                AddGameView()
            }
        }
    }

    @ViewBuilder
    private func coverImage(for game: Game) -> some View {
        if let data = game.coverImageData, let uiImage = UIImage(data: data) {
            Image(uiImage: uiImage)
                .resizable()
                .scaledToFill()
        } else {
            RoundedRectangle(cornerRadius: 8)
                .fill(.quaternary)
                .overlay {
                    Image(systemName: "dice")
                        .foregroundStyle(.secondary)
                }
        }
    }
}
