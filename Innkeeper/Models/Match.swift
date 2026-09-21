//
//  Match.swift
//  Innkeeper
//
//  Created by Jesús Ortega Ayala on 21/09/2026.
//

import Foundation
import SwiftData

@Model
final class Match {
    var game: Game?
    var date: Date
    
    init(game: Game? = nil, date: Date) {
        self.game = game
        self.date = date
    }
}
