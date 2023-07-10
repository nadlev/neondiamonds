//
//  CardView.swift
//  NeonDiamond iOS
//
//  Created by 99999999 on 22.06.2023.
//

import Foundation
import SwiftUI

//Card content view
struct CardView: View {
    var card: CardModel.Card
    
    @State private var animatedBonusRemaining: Double = 0
    
    var body: some View {
        GeometryReader {
            geo in
            ZStack {
                //Start time bonus animation for each card
                if card.isConsumingBonusTime {
                    Pie(startAngle: Angle(degrees: 0 - 90), endAngle: Angle(degrees: 1 - animatedBonusRemaining * 360 - 90)).padding(5).opacity(0.14)
                        .onAppear {
                            animatedBonusRemaining = card.bonusRemaining
                            withAnimation(.linear(duration: card.bonusTimeRemaining)) {
                                animatedBonusRemaining = 0
                            }
                        }
                } else { }
                
                Text(card.content).font(.largeTitle)
                    .rotationEffect(Angle.degrees(card.isMatched ? 360: 0))
            }
            .modifier(Cardify(isFaceUp: card.isFaceUp))
        }
    }
}
