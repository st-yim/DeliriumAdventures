//
//  ColorMatchView.swift
//  DeliriumAdventures
//
//  Created by Steven Yim on 1/29/24.
//

import SwiftUI

struct ColorMatchView: View {
    @StateObject private var gameViewModel = ColorMatchViewModel()
    @State private var showColorSelection = false

    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(
                    gradient: Gradient(colors: [Color.purple, Color("universal")]),
                    startPoint: .leading,
                    endPoint: .trailing
                )
                .edgesIgnoringSafeArea(.all)
                
                VStack {
                    Text("Color Cognition")
                        .font(.system(size: 40, weight: .heavy))
                    
                    if !gameViewModel.isGameActive {
                        Text("(Instructions: Memorize and replicate the color sequences. Complete the exercise three times to proceed.)")
                            .multilineTextAlignment(.center)
                            .font(.system(size: 15, weight: .light))
                            .padding()
                    }
                    
                    if gameViewModel.isGameActive {
                        ColorSequenceView(colors: gameViewModel.colorSequence)
                            .padding()
                        
                        NavigationLink(destination: ColorSelectionView(colors: gameViewModel.fixedColors, didSelectColor: { color in
                            gameViewModel.didSelectColor(color)
                        }, submitAction: {
                            gameViewModel.submitColors()
                            showColorSelection = false // Dismiss the ColorSelectionView
                        }), isActive: $showColorSelection) {
                            EmptyView()
                        }
                        .hidden()
                        
                        GameButtonView(title: "Select Colors", color: Color.blue, width: 200, height: 50, action: {
                            showColorSelection = true
                        })
                        .padding()
                        
                        GameButtonView(title: "Exit", color: Color.red, width: 100, height: 35, action: {
                            gameViewModel.isGameActive = false
                        })
                        
                    } else {
                        GameButtonView(title: "Start Game", color: Color.blue, width: 200, height: 50, action: {
                            gameViewModel.startGame()
                        })
                        .padding()
                    }
                }
            }
            .alert(isPresented: .constant(gameViewModel.correctCount == 3)) {
                Alert(title: Text("Congratulations!"), message: Text("You completed the task 3 times. Let's continue!"), dismissButton: .default(Text("Continue")) {
                    gameViewModel.startGame()
                })
            }
        }
    }
}

#Preview {
    ColorMatchView()
}
