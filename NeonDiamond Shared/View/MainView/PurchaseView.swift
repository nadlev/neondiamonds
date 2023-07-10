//
//  PurchaseView.swift
//  NeonDiamond iOS
//
//  Created by 99999999 on 22.06.2023.
//

import SwiftUI
import StoreKit

struct PurchaseView: View {
    @StateObject private var purchaseManager = PurchaseManager()

    var body: some View {
        ZStack {
            
            Image("BG")
                        .resizable()
                        .scaledToFill()
                        .edgesIgnoringSafeArea(.all)
            
                VStack {
                    Text("Unlock Medium and Hard Levels")
                        .padding(5)
                        .foregroundColor(.white)
                        .font(.system(size: 18, design: .serif))
                    Button("Purchase") {
                        purchaseManager.fetchProducts()
                    }
                    .modifier(FunctionButton(color: Color("Green")))
                    .shadow(color: Color("Card"), radius: 18)
                    
                    if purchaseManager.hasPurchased {
                        Text("Purchase successful!")
                    }
                }
                .onAppear {
                    SKPaymentQueue.default().add(purchaseManager)
                }
                .onDisappear {
                    SKPaymentQueue.default().remove(purchaseManager)
            }
        }
    }
}
