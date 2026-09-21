//
//  Difficulty.swift
//  Innkeeper
//
//  Created by Jesús Ortega Ayala on 21/09/2026.
//


enum Difficulty: String, Codable, CaseIterable, Identifiable {
    case easy = "Fácil"
    case medium = "Media"
    case hard = "Difícil"

    var id: Self { self }
}