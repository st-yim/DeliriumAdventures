//
//  CardMatchModel.swift
//  DeliriumAdventures
//
//  Created by Steven Yim on 1/29/24.
//

import Foundation
import SwiftUI

class Card: Identifiable, ObservableObject {
    @Published var isFaceUp = false
    @Published var isMatched = false
    
    var id = UUID()
    var text: String
    
    init(text: String) {
        self.text = text
    }
    
    func turnOver() {
        self.isFaceUp.toggle()
    }
}

let cardValues: [String] = [
    "🧠",
    "🫁",
    "👁️",
    "🩺",
    "⛑️",
    "💊",
    "💉",
    "🏥"
]

func createCardList() -> [Card] {
    var cardList = [Card]()
    
    for cardValue in cardValues {
        cardList.append(Card(text: cardValue))
        cardList.append(Card(text: cardValue))
    }
    
    return cardList
}

let faceDownCard = Card(text: "?")
