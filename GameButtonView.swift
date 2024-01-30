//
//  GameButtonView.swift
//  DeliriumAdventures
//
//  Created by Steven Yim on 1/28/24.
//

import SwiftUI

struct GameButtonView: View {
    let title: String
    let color: Color
    let width: Int
    let height: Int
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundColor(.white)
                .padding()
                .frame(width: CGFloat(width), height: CGFloat(height)) // Set the width and height
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .fill(color)
                        .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: 3)
                )
        }
        .padding()
    }
}
