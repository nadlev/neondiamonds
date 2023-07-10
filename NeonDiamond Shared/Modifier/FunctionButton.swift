//
//  FunctionButton.swift
//  NeonDiamond iOS
//
//  Created by 99999999 on 22.06.2023.
//

import SwiftUI

struct FunctionButton: ViewModifier {
    var color: Color
    
    func body(content: Content) -> some View {
        content
            .padding(10)
            .frame(width: 150)
            .background(color)
            .foregroundColor(.white)
            .cornerRadius(10)
    }
}
