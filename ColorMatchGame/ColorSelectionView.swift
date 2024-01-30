//
//  ColorSelectionView.swift
//  DeliriumAdventures
//
//  Created by Steven Yim on 1/28/24.
//

import SwiftUI

struct ColorSelectionView: View {
    let colors: [Color]
    let didSelectColor: (Color) -> Void
    let submitAction: () -> Void

    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [Color.purple, Color("universal")]),
                startPoint: .leading,
                endPoint: .trailing
            )
            .edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("Select Colors")
                    .font(.largeTitle)
                    .padding()
                
                ColorSelectionRow(colors: colors, didSelectColor: didSelectColor)
                    .padding()
                
                GameButtonView(title: "Submit", color: Color.blue, width: 200, height: 50, action: submitAction)
                    .padding()
            }
        }
    }
}
