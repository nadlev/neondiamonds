//
//  GameVM.swift
//  NeonDiamond iOS
//
//  Created by 99999999 on 22.06.2023.
//

import Foundation
import SwiftUI

class GameVM: ObservableObject {
    @State var emojis = ["🍒", "🎱", "💎", "🔔", "♦️", "🎁", "💰", "🎲", "🍓", "🫦"]
    @Published var randomNumberOfPairs: Int
    @Published private var model: CardModel
    
    var cards: Array<CardModel.Card> {
        model.cards
    }
    
    func createMemoryGame() {
        self.model = CardModel(numberOfPairsOfCards: randomNumberOfPairs) { pairIndex in
            emojis[pairIndex]
        }
    }
    
    init(emojis: [String] = ["🍒", "🎱", "💎", "🔔", "♦️", "🎁", "💰", "🎲", "🍓", "🫦"], randomNumberOfPairs: Int) {
        self.emojis = emojis
        self.randomNumberOfPairs = randomNumberOfPairs
        self.model = CardModel(numberOfPairsOfCards: randomNumberOfPairs) {
            pairIndex in emojis[pairIndex]
        }
    }
    
    func choose(_ card: CardModel.Card) {
        model.choose(card: card)
    }
    
    func shuffle() {
        model.shuffle()
    }
    
    func restart() {
        shuffle()
        createMemoryGame()
    }
    
    func getScore() -> Int {
        return model.getScore()
    }
    
    func getCheck() -> Int {
        return model.getCheck()
    }
}
