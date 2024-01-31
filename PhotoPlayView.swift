//
//  PhotoPlayView.swift
//  DeliriumAdventures
//
//  Created by Steven Yim on 1/29/24.
//

import SwiftUI

struct PhotoPlayView: View {
    @Binding var isPlaying: Bool

    var body: some View {
        VStack {
            Text("Playing!")
            // Add your game logic or content here
        }
    }
}

#Preview {
    PhotoPlayView(isPlaying: .constant(true))
}
