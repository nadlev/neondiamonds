//
//  GameView.swift
//  NeonDiamond iOS
//
//  Created by 99999999 on 22.06.2023.
//

import SwiftUI
import AVFoundation

struct GameView: View {
    @ObservedObject var userModel: UserVM = UserVM()
    @ObservedObject var memoryGame: GameVM
    
    @State var userName = ""
    @State var show = false
    @State var gameMode: Int
    @State var buttonClickCheck: Bool
    
    init(memoryGame: GameVM = GameVM(randomNumberOfPairs: 5), gameMode: Int, userName: String = "", show: Bool = false, buttonClickCheck: Bool = false) {
        self.userModel = UserVM()
        self.memoryGame = GameVM(randomNumberOfPairs: gameMode)
        self.userName = userName
        self.show = show
        self.gameMode = gameMode
        self.buttonClickCheck = buttonClickCheck
    }

    var body: some View {
        ZStack {
            Image("BG")
                        .resizable()
                        .scaledToFill()
                        .edgesIgnoringSafeArea(.all)

            VStack {
                HStack {
                    Text("Welcome: \(userName)")
                        .modifier(TextModifier())
                    Spacer()
                    Text("Score: \(memoryGame.getScore())")
                        .modifier(TextModifier())
                }
                
                gameBody
                //Spacer()
                
                HStack{
                    shuffle
                    restart
                }
                Spacer()
                .padding(.horizontal)
            }
            .padding(20)
            .foregroundColor(Color("Card"))
            .navigationBarBackButtonHidden(true)
            .navigationBarTitle(Text(""), displayMode: .inline)
            
            //Replace back button with customize one
            .navigationBarItems(leading: BackButtonView(name: userName, game: memoryGame, userModel: userModel))
            
            //Overlap User register and Win view with condition check
            UserRegisterView(name: $userName ,userModel: userModel, buttonCheck: $buttonClickCheck, show: $show)
            WinView(check: memoryGame.getCheck(), gameMode: gameMode, score: memoryGame.getScore())
            //Play a sound when this view appear
                .onAppear {
                    userModel.updatePoint(point: memoryGame.getScore())
                    playSound(sound: "level-win", type: "mp3")
                }
        }
        
        //Play and stop background sound on appear and on dissapear
        .onAppear {
            MusicPlayer.shared.startBackgroundMusic(backgroundMusicFileName: "game")
        }
        .onDisappear {
            MusicPlayer.shared.stopBackgroundMusic()
        }
        
    }
    
    //Game body view here
    var gameBody: some View {
        Grid(items: memoryGame.cards, aspectRatio: 2/3, content: {
            card in
            !card.isFaceUp && card.isMatched ?  AnyView(rec(game: memoryGame)) : AnyView(checkMatch(card: card, game: memoryGame))
        })
    }
    
    //If is two cards matched, hide this card
    func rec(game: GameVM) -> some View {
        Rectangle().opacity(0.0)
            .onAppear {
                userModel.updatePoint(point: game.getScore())
                print(game.getScore())
            }
    }
    
    //function to render the cards
    func checkMatch(card: CardModel.Card, game: GameVM) -> some View{
        CardView(card: card)
            .transition(AnyTransition.scale)
            .onTapGesture {
                print(game.getScore())
                withAnimation {
                    memoryGame.choose(card)
                }
            }
    }
    
    //Shuffle button here
    var shuffle: some View {
        Button {
            withAnimation {
                memoryGame.shuffle()
            }
        } label: {
            Text("Shuffle")
                .foregroundColor(Color("White"))
        }
        .modifier(FunctionButton(color: Color("Green")))
        .shadow(color: .white, radius: 10)
    }
    
    //Restart button here and reset user score
    var restart: some View {
        Button {
            withAnimation {
                memoryGame.restart()
                userModel.updatePoint(point: 0)
            }
        }  label: {
            Text("Restart")
                .foregroundColor(Color("White"))
        }
        .modifier(FunctionButton(color: Color("Red")))
        .shadow(color: .white, radius: 10)
    }
}

//Customize back button
struct BackButtonView: View {
    var name: String
    @ObservedObject var game: GameVM
    @ObservedObject var userModel: UserVM
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
        //Return back to Home view
        Button(
            action: {
                self.presentationMode.wrappedValue.dismiss()
                userModel.updatePoint(point: game.getScore())
            }, label: {
                Image(systemName: "chevron.backward")
                    .foregroundColor(Color("Gray"))
                Text("Return")
                    .foregroundColor(Color("Gray"))
            }
        )
    }
}
