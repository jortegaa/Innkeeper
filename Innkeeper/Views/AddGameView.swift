//
//  AddGameView.swift
//  Innkeeper
//
//  Created by Jesús Ortega Ayala on 21/09/2026.
//


import SwiftUI
import SwiftData
import PhotosUI

struct AddGameView: View {
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss

    @State private var name = ""
    @State private var minPlayers = 1
    @State private var maxPlayers = 4
    @State private var difficulty: Difficulty = .medium
    @State private var selectedPhoto: PhotosPickerItem?
    @State private var coverImageData: Data?

    private var isValid: Bool {
        !name.trimmingCharacters(in: .whitespaces).isEmpty && maxPlayers >= minPlayers
    }

    var body: some View {
        NavigationStack {
            Form {
                Section("Datos del juego") {
                    TextField("Nombre", text: $name)
                    Picker("Dificultad", selection: $difficulty) {
                        ForEach(Difficulty.allCases) { level in
                            Text(level.rawValue).tag(level)
                        }
                    }
                }

                Section("Jugadores") {
                    Stepper("Mínimo: \(minPlayers)", value: $minPlayers, in: 1...20)
                    Stepper("Máximo: \(maxPlayers)", value: $maxPlayers, in: 1...20)
                }

                Section("Imagen") {
                    if let data = coverImageData, let uiImage = UIImage(data: data) {
                        Image(uiImage: uiImage)
                            .resizable()
                            .scaledToFit()
                            .frame(maxHeight: 200)
                    }
                    PhotosPicker(selection: $selectedPhoto, matching: .images) {
                        Label(coverImageData == nil ? "Elegir imagen" : "Cambiar imagen",
                              systemImage: "photo")
                    }
                }
            }
            .navigationTitle("Nuevo juego")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancelar") { dismiss() }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Guardar") { save() }
                        .disabled(!isValid)
                }
            }
            .onChange(of: selectedPhoto) { _, newItem in
                Task {
                    if let data = try? await newItem?.loadTransferable(type: Data.self) {
                        coverImageData = data
                    }
                }
            }
        }
    }

    private func save() {
        let game = Game(coverImageData: coverImageData,
                        name: name.trimmingCharacters(in: .whitespaces),
                        minPlayers: minPlayers,
                        maxPlayers: maxPlayers,
                        difficulty: difficulty
        )
        
        context.insert(game)
        dismiss()
    }
}
