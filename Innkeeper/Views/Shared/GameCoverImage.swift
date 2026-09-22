//
//  GameCoverImage.swift
//  Innkeeper
//
//  Created by Jesús Ortega Ayala on 22/09/2026.
//

import SwiftUI

/// Muestra la portada de un juego a partir de sus datos de imagen.
///
/// Solo produce la imagen (escalada con `.scaledToFill()`) o un placeholder
/// cuando no hay datos. El tamaño y el recorte los aplica quien la usa,
/// para poder reutilizarla en distintos contextos.
struct GameCoverImage: View {
    let imageData: Data?

    var body: some View {
        if let imageData, let uiImage = UIImage(data: imageData) {
            Image(uiImage: uiImage)
                .resizable()
                .scaledToFill()
        } else {
            Rectangle()
                .fill(.quaternary)
                .overlay {
                    Image(systemName: "dice")
                        .font(.largeTitle)
                        .foregroundStyle(.secondary)
                }
        }
    }
}

#Preview {
    GameCoverImage(imageData: nil)
        .frame(width: 100, height: 100)
        .clipShape(RoundedRectangle(cornerRadius: 20))
}
