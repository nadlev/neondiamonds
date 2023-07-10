//
//  GameMode.swift
//  NeonDiamond iOS
//
//  Created by 99999999 on 22.06.2023.
//

import SwiftUI

struct GameMode: View {
    var gameMode: Int
    var tag: Int
    var isLocked: Bool
    @Binding var action: Int?
    var title: String

    var body: some View {
        if isLocked {
            NavigationLink(destination: PurchaseView(), tag: tag, selection: $action) {
                Button {
                    self.action = tag
                    playSound(sound: "click", type: "wav")
                } label: {
                    Text(title)
                        .padding(5)
                        .font(.system(size: 15, design: .serif))
                }
                .modifier(GameButton())
            }
        } else {
            NavigationLink(destination: GameView(gameMode: gameMode), tag: tag, selection: $action) {
                Button {
                    self.action = tag
                    playSound(sound: "click", type: "wav")
                } label: {
                    Text(title)
                        .padding(5)
                        .font(.system(size: 15, design: .serif))
                }
                .modifier(GameButton())
            }
        }
    }
}
