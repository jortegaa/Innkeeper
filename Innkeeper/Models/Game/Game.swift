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
    @Attribute(.externalStorage) var coverImageData: Data?
    var name: String
    var minPlayers: Int = 1
    var maxPlayers: Int = 4
    var difficulty: Difficulty
    var dateAdded: Date
    @Relationship(deleteRule: .cascade, inverse: \Match.game)
    var matches: [Match] = []
    
    init(coverImageData: Data? = nil,
         name: String,
         minPlayers: Int = 1,
         maxPlayers: Int = 4,
         difficulty: Difficulty = .medium,
         dateAdded: Date = .now,
         matches: [Match] = []) {
        self.coverImageData = coverImageData
        self.name = name
        self.minPlayers = minPlayers
        self.maxPlayers = maxPlayers
        self.difficulty = difficulty
        self.dateAdded = dateAdded
        self.matches = matches
    }
}
