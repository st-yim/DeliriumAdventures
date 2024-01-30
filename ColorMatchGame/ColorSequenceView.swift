//
//  ColorSequenceView.swift
//  DeliriumAdventures
//
//  Created by Steven Yim on 1/28/24.
//

import SwiftUI

struct ColorSequenceView: View {
    let colors: [Color]
    
    @State var jump = false

    var body: some View {
        HStack(spacing: 15) {
            ForEach(colors, id: \.self) { color in
                Circle()
                    .fill(color)
                    .frame(width: jump ? 30 : 50, height: 50)
                    .overlay(Circle().stroke(Color.black, lineWidth: 2))
                    .onTapGesture {
                        withAnimation() {
                            jump.toggle()
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
                            withAnimation() {
                                jump.toggle()
                            }
                        }
                    }
            }
        }
        .padding()
    }
}


#Preview {
    ColorSequenceView(colors: [.red, .blue, .green, .yellow])
}
