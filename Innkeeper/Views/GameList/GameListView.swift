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

    private let columns = Array(repeating: GridItem(.flexible(), spacing: 16), count: 3)

    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 16) {
                    ForEach(games) { game in
                        NavigationLink(value: game) {
                            GameCardView(game: game)
                        }
                        .buttonStyle(.plain)
                    }
                }
                .padding()
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
}
