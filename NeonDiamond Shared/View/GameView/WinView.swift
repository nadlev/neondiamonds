//
//  WinView.swift
//  NeonDiamond iOS
//
//  Created by 99999999 on 22.06.2023.
//

import SwiftUI

struct WinView: View {
    
    var check: Int
    var gameMode: Int
    var score: Int
    
    var body: some View {
        if gameMode == check {
            ZStack {
                Color.black.opacity(gameMode == check ? 0.9 : 0).edgesIgnoringSafeArea(.all)
                ZStack {
                    Color("Card")
                    ZStack {
                        Image("Win")
                            .opacity(0.7)
                        VStack {
                            Text("You win")
                                .font(.system(.largeTitle, design: .serif))
                                .fontWeight(.bold)
                                .shimmer(.init(tint: .white.opacity(0.6), highlight: .white, blur: 6))
                                .foregroundColor(.white)
                            Text("Your score: \(self.score)")
                                .foregroundColor(.white)
                        }
                        .padding()
                    }
                }
                .frame(width: 300, height: 300)
                .cornerRadius(20)
                .shadow(color: .white, radius: 10)
            }
        }
    }
}

//struct WinView_Previews: PreviewProvider {
//    static var previews: some View {
//        WinView()
//    }
//}
