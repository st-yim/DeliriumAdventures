//
//  ColorSelectionRow.swift
//  DeliriumAdventures
//
//  Created by Steven Yim on 1/28/24.
//

import SwiftUI

struct ColorSelectionRow: View {
    let colors: [Color]
    let didSelectColor: (Color) -> Void

    var body: some View {
        HStack(spacing: 16) {
            ForEach(colors, id: \.self) { color in
                Button(action: {
                    didSelectColor(color)
                }) {
                    Circle()
                        .fill(color)
                        .frame(width: 50, height: 50)
                        .overlay(Circle().stroke(Color.black, lineWidth: 2))
                }
            }
        }
        .padding()
    }
}
