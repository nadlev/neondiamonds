//
//  HomeView.swift
//  NeonDiamond iOS
//
//  Created by 99999999 on 22.06.2023.
//

import SwiftUI
import AVFoundation
import StoreKit

struct HomeView: View {
    
    @State private var action: Int? = 0
    @StateObject private var purchaseManager = PurchaseManager()
    @State private var selectedTab: Int = 0
    
    var body: some View {
        ZStack {
            NavigationView {
                ZStack {
                    Image("BGHome")
                        .resizable()
                        .scaledToFill()
                        .edgesIgnoringSafeArea(.all)
                    VStack {
                        if selectedTab == 0 {
                            Image("iMemory")
                                .resizable()
                                .scaledToFit()
                            
                            Text("Choose a game mode")
                                .bold()
                                .modifier(TextModifier())
                            GameMode(gameMode: 4, tag: 1, isLocked: false, action: $action, title: "EASY")
                                            .shadow(color: Color("Card"), radius: 10)
                            GameMode(gameMode: 8, tag: 2, isLocked: false, action: $action, title: "MEDIUM")
                                .shadow(color: Color("Card"), radius: 10)
                            GameMode(gameMode: 10, tag: 3, isLocked: false, action: $action, title: "HARD")
                                .shadow(color: Color("Card"), radius: 10)
                            
                            Spacer()
                            
                        } else if selectedTab == 1 {
                            HowToPlayView()
                        } else if selectedTab == 2 {
                            QRCodeView()
                        } else if selectedTab == 3 {
                            LeaderboardView()
                        }
                    }
                }
                .navigationBarHidden(true)
            }
            .edgesIgnoringSafeArea(.bottom)
            
            VStack {
                Spacer()
                HStack {
                    Button(action: {
                        selectedTab = 0
                    }) {
                        VStack {
                            Image(systemName: "house.fill")
                            Text("Home")
                        }
                    }
                    
                    .foregroundColor(selectedTab == 0 ? Color("Card") : .gray)

                    Spacer()
                    
                    Button(action: {
                        selectedTab = 1
                    }) {
                        VStack {
                            Image(systemName: "questionmark.circle.fill")
                            Text("Rules")
                        }
                    }
                    .foregroundColor(selectedTab == 1 ? Color("Card") : .gray)

                    Spacer()
                    
                    Button(action: {
                        selectedTab = 2
                    }) {
                        VStack {
                            Image(systemName: "qrcode")
                            Text("QRCode")
                        }
                    }
                    .foregroundColor(selectedTab == 2 ? Color("Card") : .gray)
                    
                    Spacer()
                    
                    Button(action: {
                        selectedTab = 3
                    }) {
                        VStack {
                            Image(systemName: "rosette")
                            Text("Leaders")
                        }
                    }
                    .foregroundColor(selectedTab == 3 ? Color("Card") : .gray)
                    
                }
                .padding()
                .background(Color.black)
                .cornerRadius(15.0)
                .frame(maxWidth: .infinity, maxHeight: .leastNonzeroMagnitude)
                .shadow(color: .white, radius: 16)
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

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
