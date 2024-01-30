//
//  GameViewModel.swift
//  DeliriumAdventures
//
//  Created by Steven Yim on 1/29/24.
//

import SwiftUI

class ColorMatchViewModel: ObservableObject {
    @Published var colorSequence: [Color] = []
    @Published var playerSequence: [Color] = []
    @Published var isGameActive = false
    @Published var correctCount = 0

    let fixedColors: [Color] = [.red, .blue, .green, .yellow]

    func startGame() {
        colorSequence = generateRandomColorSequence()
        playerSequence = []
        isGameActive = true
        correctCount = 0
    }

    func generateRandomColorSequence() -> [Color] {
        return (0..<5).map { _ in fixedColors.randomElement()! }
    }

    func didSelectColor(_ selectedColor: Color) {
        playerSequence.append(selectedColor)

        // Limit the number of displayed colors to 5
        if playerSequence.count > 5 {
            playerSequence.removeFirst()
        }
    }

    func submitColors() {
        if colorSequence == playerSequence {
            correctCount += 1
            print("Correct sequence!")
        } else {
            print("Wrong sequence. Game over!")
        }

        if correctCount == 3 {
            isGameActive = false
        }
        colorSequence = generateRandomColorSequence()
    }
}



