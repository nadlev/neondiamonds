//
//  UserRegisterView.swift
//  NeonDiamond iOS
//
//  Created by 99999999 on 22.06.2023.
//

import SwiftUI

struct UserRegisterView: View {
    
    @Binding var name: String
    @State private var action: Int? = 0
    @State private var already = false
    @State private var empty = false
    @ObservedObject var userModel: UserVM
    @Binding var buttonCheck: Bool
    
    @Binding var show: Bool
    
    var body: some View {
        if !show {
            ZStack {
                Image("BG")
                            .resizable()
                            .scaledToFill()
                            .edgesIgnoringSafeArea(.all)

                
                ZStack {
                    Color("Purple")
                    VStack {
                        Text("Create your username")
                            .fontWeight(.bold)
                            
                            .modifier(TextModifier())
                        
                        HStack {
                            Text("User name: ")
                                .foregroundColor(.white)
                                .shimmer(.init(tint: .white.opacity(0.8), highlight: Color("Card"), blur: 6))
                                .font(.system(.title2, design: .serif))
                            TextField("Enter user name", text: $name)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                
                        }
                        Spacer()
                        if(already) {
                            Text("User already exists, please register with a different name")
                                .foregroundColor(Color("Gray"))
                        } else if(empty) {
                            Text("Please enter a name")
                                .foregroundColor(Color("Gray"))
                        } else {}
                                                
                        Button {
                            if (userModel.getUsers().contains(name)) {
                                already = true
                                empty = false
                            } else if (name == "") {
                                empty = true
                                already = true
                            }
                            else {
                                buttonCheck = true
                                already = false
                                empty = false
                                show = true
                                userModel.addUser(name)
                            }
                        } label: {
                            Text("Play game")
                                .padding(5)
                                //.bold()
                                .shimmer(.init(tint: .white.opacity(0.7), highlight: .white, blur: 6))
                        }
                        .buttonStyle(.borderedProminent)
                    }
                    .padding()
                }
                .frame(width: 300, height: 250)
                .cornerRadius(20)
                .shadow(color: Color("Card"), radius: 18)
            }
        }
    }
}
