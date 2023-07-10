//
//  CardModel.swift
//  NeonDiamond iOS
//
//  Created by 99999999 on 22.06.2023.
//

import Foundation
import SwiftUI
import AVFoundation

struct CardModel {
    private(set) var cards: Array<Card>
    private(set) var score: Int
    private(set) var check: Int
    
    private var indexOfFacingCard: Int?
    private var numberOfPairsOfCards: Int
    
    init(numberOfPairsOfCards: Int, contentFactory: (Int) -> String) {
        cards = []
        score = 0
        check = 0
        self.numberOfPairsOfCards = numberOfPairsOfCards
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = contentFactory(pairIndex)
            cards.append(Card(id: pairIndex * 2, content: content))
            cards.append(Card(id: pairIndex * 2 + 1, content: content))
        }
        cards.shuffle()
    }
    mutating func choose(card: Card) {
        if let idx = cards.firstIndex(where: {$0.id == card.id}),
           !cards[idx].isFaceUp, !cards[idx].isMatched {
            if let potentialMatchIndex = indexOfFacingCard {
                if cards[potentialMatchIndex].content == cards[idx].content {
                    cards[potentialMatchIndex].isMatched = true
                    cards[idx].isMatched = true
                    if(numberOfPairsOfCards > 6) {
                        changeScore(to: score + MATCH_POINT + Int(6 - cards[potentialMatchIndex].pastTime))
                    } else {
                        changeScore(to: score + MATCH_POINT)
                    }
                    win()
                    playSound(sound: "success", type: "mp3")
                } else if score - 5 > 1 && numberOfPairsOfCards == 10 {
                    changeScore(to: score + MISMATCH_POINT)
                } else {
                    playSound(sound: "failure", type: "mp3")
                }
                indexOfFacingCard = nil
            } else {
                for index in cards.indices {
                    cards[index].isFaceUp = false
                }
                indexOfFacingCard = idx
            }
            cards[idx].isFaceUp.toggle()
        }
    }
    
    mutating func shuffle() {
        cards.shuffle()
    }
    
    func getCheck() -> Int {
        return check
    }
    
    func getScore() -> Int {
        return score
    }
    
    mutating func changeScore(to newScore: Int) {
        score = newScore
    }
    
    mutating func win() {
        check += 1
    }
    
    struct Card: Hashable, Identifiable {
        var id: Int
        
        var isFaceUp: Bool = false {
            didSet {
                if isFaceUp {
                    
                }
                else {
                    
                }
            }
        }
        
        var isMatched: Bool = false {
            didSet {
                
            }
        }
        var content: String
        
        var bonusTimeLimit: TimeInterval = 6
        
        var pastTime: TimeInterval = 0
        var lastFaceUpDate: Date?
        
        private var faceUpTime: TimeInterval {
            if let lastFaceUpDate = self.lastFaceUpDate {
                return Date().timeIntervalSince(lastFaceUpDate)
            } else {
                return TimeInterval(0)
            }
        }
        
        var bonusTimeRemaining: TimeInterval {
            max(0, bonusTimeLimit - faceUpTime)
        }
        
        var bonusRemaining: Double {
            return (bonusTimeLimit > 0 && bonusTimeRemaining > 0) ? bonusTimeRemaining/bonusTimeLimit : 0
        }
        
        var isConsumingBonusTime: Bool {
            isFaceUp && !isMatched && bonusTimeRemaining > 0
        }
        
        private mutating func startUsingBonusTime() {
            if isConsumingBonusTime, lastFaceUpDate == nil {
                lastFaceUpDate = Date()
            }
        }
        
        private mutating func stopUsingBonusTime() {
            pastTime = faceUpTime
            lastFaceUpDate = nil
        }
    }
    
    let MATCH_POINT = 10
    let MISMATCH_POINT = -5
}
