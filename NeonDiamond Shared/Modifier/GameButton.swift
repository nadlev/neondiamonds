//
//  GameButton.swift
//  NeonDiamond iOS
//
//  Created by 99999999 on 22.06.2023.
//

import Foundation
import SwiftUI

struct GameButton: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(10)
            .frame(width: 150)
            .background(Color("Red-Wine"))
            .foregroundColor(.white)
            .cornerRadius(10)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color("Green"), lineWidth: 5)
            )
            .padding(5)
    }
}
