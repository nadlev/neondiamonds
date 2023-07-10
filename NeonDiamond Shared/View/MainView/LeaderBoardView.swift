//
//  LeaderBoardView.swift
//  NeonDiamond iOS
//
//  Created by 99999999 on 22.06.2023.
//

import SwiftUI

struct LeaderboardView: View {
    
    @ObservedObject var userModel: UserVM = UserVM()
    
    var body: some View {
        let point = userModel.getPoints()
        let user = userModel.getUsers()
        
        Group {
            if user.count > 0 && point.count > 0 && point.count == user.count {
                ScrollView {
                    
                    Text("🌟 OUR LEADERS 🌟")
                        .foregroundColor(.white)
                        .bold()
                        .font(.system(.title2, design: .serif))
                    
                    ForEach(userModel.getUsers().indices, id: \.self) {
                        index in
                        HStack {
                            
                            HStack {
                                Text(user[index])
                                Spacer()
                                Text("\(point[index])")
                            }
                            .modifier(TextModifier())
                            .padding()
                            .frame(maxWidth: .infinity, maxHeight: 200)
                            .background(Color("Purple"))
                        .cornerRadius(20)
                        }
                    }
                    Spacer()
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .padding()
                .ignoresSafeArea(.all, edges: .bottom)
                .background(
                    Image("BG")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all))
            } else {
                Text("No current user")
                    .font(.system(.title2, design: .serif))
                    .bold()
                    .foregroundColor(.white)
            }
        }
        .onAppear {
            MusicPlayer.shared.startBackgroundMusic(backgroundMusicFileName: "grand-final-orchestral")
        }
        .onDisappear {
            MusicPlayer.shared.stopBackgroundMusic()
        }
        .navigationTitle("LeaderBoard")
    }
}

//struct LeaderboardView_Previews: PreviewProvider {
//    static var previews: some View {
//        LeaderboardView()
//    }
//}
