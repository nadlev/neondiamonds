//
//  QRCodeView.swift
//  NeonDiamond iOS
//
//  Created by 99999999 on 22.06.2023.
//

import SwiftUI

struct QRCodeView: View {
    
    var body: some View {
        
            VStack {
            
//                Text("Scan our QR Code!")
//                    .font(.system(size: 30, weight: .bold, design: .serif))
//                    .foregroundColor(Color.white)
//                    .frame(maxWidth: .infinity)
//                    .multilineTextAlignment(.center)
//                    .background(
//                        RoundedRectangle(cornerRadius: 8).fill(Color("ColorLightBlueMain"))
//                    )
//                    .padding()
                
                Spacer()
                
                QRCodeViewModel(url: "https://neondiamonds.store/starting")
                    .frame(height: 185)
                    .shadow(color: Color("Card"), radius: 12)
                
                Spacer()
                
                Text("You can also scan our QR Code to unlock new levels!")
                    .multilineTextAlignment(.center)
                    .frame(width: 320, height: 80, alignment: .center)
                    .shimmer(.init(tint: .black.opacity(0.8), highlight: .white, blur: 3))
                    //.bold()
                    .font(.system(.headline, design: .serif))
                    //.fontWeight(.bold)
                    .background(
                      RoundedRectangle(cornerRadius: 12)
                        .fill(LinearGradient(gradient: Gradient(colors: [Color.white, Color("Card")]), startPoint: .top, endPoint: .bottom))
                      .shadow(color: Color("ColorLightBlueMain"), radius: 12, x: 0, y: 6)
                    )
                
                Spacer()
                
        }
    }
}

struct QRCodeView_Previews: PreviewProvider {
    static var previews: some View {
        QRCodeView()
    }
}
