//
//  InnkeeperApp.swift
//  Innkeeper
//
//  Created by Jesús Ortega Ayala on 21/09/2026.
//

import SwiftUI
import SwiftData

@main
struct InnkeeperApp: App {
    var body: some Scene {
        WindowGroup {
            GameListView()
        }
        .modelContainer(for: [Game.self, Match.self])
    }
}
