//
//  CardMatchView.swift
//  DeliriumAdventures
//
//  Created by Steven Yim on 1/29/24.
//

import SwiftUI

struct CardMatchView: View {
    
    private var fourColumnGrid = [GridItem(.flexible()),
                                  GridItem(.flexible()),
                                  GridItem(.flexible()),
                                  GridItem(.flexible())]
    
    @State var cards = createCardList().shuffled()
    @State var MatchedCards = [Card]()
    @State var UserChoices = [Card]()
    
    var body: some View {
        GeometryReader { geo in
            VStack{
                Text("Card Match")
                    .font(.largeTitle)
                
                LazyVGrid(columns: fourColumnGrid, spacing: 10) {
                    ForEach(cards){ card in
                        CardView(card: card,
                                 MatchedCards: $MatchedCards,
                                 UserChoices: $UserChoices,
                                 width: Int(geo.size.width/4 - 20))}
                }
                
                VStack{
                    Text("Match these cards to win:")
                    LazyVGrid(columns: fourColumnGrid, spacing: 5) {
                        ForEach(cardValues, id:\.self) { cardValue in
                            if !MatchedCards.contains(where: {$0.text ==
                                cardValue}) {
                                Text(cardValue)
                                    .font(.system(size: 40))
                            }
                        }
                    }
                }
            }
            .padding(20)
        }
    }
}

#Preview {
    CardMatchView()
}
