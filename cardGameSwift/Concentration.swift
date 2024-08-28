//
//  Concentration.swift
//  cardGameSwift
//
//  Created by kaushik.bha on 27/08/24.
//

import Foundation

class Concentration
{
    var cards = [Card]();
    
    var indexOfOneChosenCard : Int?
    
    func chooseCard(at index:Int)
    {
        if(!cards[index].isMatched) {
            if let matchIndex = indexOfOneChosenCard , matchIndex != index {
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                indexOfOneChosenCard = nil
            } else {
                for id in cards.indices {
                    cards[id].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOneChosenCard = index
            }
        }
    }
    
    init (numberOfPairOfCards : Int) {
        for _ in 1...numberOfPairOfCards {
            let card = Card();
            cards+=[card,card];
        }
    }
    
}
