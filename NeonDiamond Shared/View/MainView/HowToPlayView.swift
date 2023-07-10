//
//  HowToPlayView.swift
//  NeonDiamond iOS
//
//  Created by 99999999 on 22.06.2023.
//

import SwiftUI

struct HowToPlayView: View {
    var body: some View {
                List {
                    
                    Section {
                        Text("""
                             🎮💪🔍 Experience Easy and Engaging Gameplay: Introducing Our Captivating Matching Game!
                             
                              🃏🧠 Our delightful game was meticulously designed with simplicity in mind, ensuring that players of all ages can enjoy the fun. The rules are straightforward: users will randomly select two cards, and if they happen to match, they'll earn a score, while the matched pair gracefully vanishes from the board. The ultimate goal? Achieve victory by successfully pairing all the cards together. Get ready for an immersive and addictive gaming experience that will keep you entertained for hours!
                             """)
                    } header: {
                        Text ("Introduction")
                    }
                    .headerProminence(.increased)
                    
                    Section {
                        Text ("""
                    Easy mode:
                    
                    Contains 4 similar pairs, earn 10 points for each matching pairs.
                    """)
                        
                        Text("""
                    Medium mode:
                    
                    Contains 6 similar pairs, earn 10 points for each matching pairs.
                    
                    Bonus points rewarded when selecting within the time limit, maximum bonus points: 5.
                    """)
                        Text("""
                    Hard mode:
                    
                    Contains 8 similar pairs, earn 10 points for each matching pairs.
                     
                    Bonus points will be the same as medium.
                    
                    Deducted 5 points if choose the wrong cards. There will be no negative score.
                    """)
                    } header: {
                        Text("Game mode")
                    } footer: {
                        Text("""
                     The choice is yours! Select your desired game mode and brace yourself for an immersive adventure that will keep you entertained and coming back for more. Unleash your gaming prowess and show the world your mastery of the match!
                     """)
                    }
                    .headerProminence(.increased)
                    
                    Section {
                        Text("All scores will be on the leaderboard")
                    } header: {
                        Text("Leaderboard score")
                    } footer: {
                        Text("Attention, esteemed players! We kindly remind you that if you choose to exit the application before completing the game, your last attempt score will not be officially registered. To ensure your hard-earned points are duly acknowledged, we encourage you to see the game through to the end.")
                    }
                    .headerProminence(.increased)
                    
                    
                }
                .navigationTitle("How to play")
                .onAppear {
                    MusicPlayer.shared.startBackgroundMusic(backgroundMusicFileName: "birdfish-happy-logo")
                }
                .onDisappear {
                    MusicPlayer.shared.stopBackgroundMusic()
                }
    }
}

struct HowToPlayView_Previews: PreviewProvider {
    static var previews: some View {
        HowToPlayView()
    }
}
