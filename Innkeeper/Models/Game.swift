//
//  Game.swift
//  Innkeeper
//
//  Created by Jesús Ortega Ayala on 21/09/2026.
//

import Foundation
import SwiftData

@Model
final class Game {
    var name: String
    var minPlayers: Int
    var maxPlayers: Int
    var dateAdded: Date
    @Relationship(deleteRule: .cascade, inverse: \Match.game)
    var matches: [Match] = []
    
    init(name: String, minPlayers: Int, maxPlayers: Int, dateAdded: Date) {
        self.name = name
        self.minPlayers = minPlayers
        self.maxPlayers = maxPlayers
        self.dateAdded = dateAdded
    }
}
