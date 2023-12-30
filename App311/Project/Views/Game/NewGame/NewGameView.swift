//
//  NewGameView.swift
//  App311
//
//  Created by IGOR on 28/12/2023.
//

import SwiftUI

struct NewGameView: View {
    
    @StateObject var viewModel: GameViewModel
    @Environment(\.presentationMode) var router
    
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("New game")
                        .foregroundColor(.white)
                        .font(.system(size: 16, weight: .regular))
                    
                    HStack {
                        
                        Button(action: {
                            
                            router.wrappedValue.dismiss()
                            
                        }, label: {
                            
                            HStack {
                                
                                Image(systemName: "chevron.left")
                                    .foregroundColor(.blue)
                                    .font(.system(size: 16, weight: .regular))
                                
                                Text("Back")
                                    .foregroundColor(.blue)
                                    .font(.system(size: 14, weight: .regular))
                                
                                Spacer()
                            }
                        })
                    }
                }
                .padding(.bottom, 40)
                
                Menu(content: {
                    
                    ForEach(viewModel.have_game, id: \.self) { index in
                        
                        Button(action: {
                            
                            viewModel.currentHGame = index
                            viewModel.gamePhoto = index
                            
                        }, label: {
                            
                                Text(index)
                                    .foregroundColor(.black)
                                    .font(.system(size: 16, weight: .regular))
                                
                        })
                    }
                    
                }, label: {
                    
                    if viewModel.currentHGame.isEmpty {
                        
                        Image(systemName: "camera.fill")
                            .frame(width: 100, height: 100)
                            .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg2")))
                            .padding()
                        
                    } else {
                        
                        Image(viewModel.currentHGame)
                            .resizable()
                            .frame(width: 150, height: 100)
                            .padding()
                    }
                })
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    LazyVStack {
                        
                        ZStack(alignment: .leading, content: {
                            
                            HStack{
                                
                                Text("Name")
                                    .foregroundColor(.white)
                                    .font(.system(size: 13, weight: .medium))
                                
                                Text("Enter")
                                    .foregroundColor(viewModel.gameName.isEmpty ? .gray : .white)
                                    .font(.system(size: 13, weight: .medium))
                                    .opacity(viewModel.gameName.isEmpty ? 1 : 0)
                                
                            }
                            
                            TextField("", text: $viewModel.gameName)
                                .foregroundColor(.white)
                                .font(.system(size: 13, weight: .medium))
                                .padding(.leading, 43)
                            
                        })
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 10).stroke(.white))
                            
                        ZStack(alignment: .leading, content: {
                            
                            HStack{
                                
                                Text("Cost")
                                    .foregroundColor(.white)
                                    .font(.system(size: 13, weight: .medium))
                                
                                Text("60")
                                    .foregroundColor(viewModel.gameCost.isEmpty ? .gray : .white)
                                    .font(.system(size: 13, weight: .medium))
                                    .opacity(viewModel.gameCost.isEmpty ? 1 : 0)
                                
                            }
                            
                            TextField("", text: $viewModel.gameCost)
                                .foregroundColor(.white)
                                .font(.system(size: 13, weight: .medium))
                                .padding(.leading, 36)
                            
                        })
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 10).stroke(.white))
                        .padding(.bottom)
                        
                        Text("Notes")
                            .foregroundColor(.white)
                            .font(.system(size: 22, weight: .regular))
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        ZStack(alignment: .leading, content: {
                            
                            HStack{
                                
                                Text("Comment")
                                    .foregroundColor(.white)
                                    .font(.system(size: 13, weight: .medium))
                                
                                Text("Enter")
                                    .foregroundColor(viewModel.gameNotes.isEmpty ? .gray : .white)
                                    .font(.system(size: 13, weight: .medium))
                                    .opacity(viewModel.gameNotes.isEmpty ? 1 : 0)
                                
                            }
                            
                            TextField("", text: $viewModel.gameNotes)
                                .foregroundColor(.white)
                                .font(.system(size: 13, weight: .medium))
                                .padding(.leading, 68)
                            
                        })
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 10).stroke(.white))
                        .padding(.bottom)
                        
                        Button(action: {
                            
                            viewModel.gamesCost += Int(viewModel.gameCost) ?? 0
                            viewModel.numGames += 1
                            viewModel.accCost += Int(viewModel.gameCost) ?? 0
                            
                            viewModel.CreatedGames.append(viewModel.gameName)
                            
                            viewModel.addGame(completion: {
                                
                                viewModel.gameName = ""
                                viewModel.gameCost = ""
                                viewModel.gameNotes = ""
                                viewModel.currentHGame = ""
                            })
           
                            router.wrappedValue.dismiss()
                            
                        }, label: {
                            
                            Text("Add")
                                .foregroundColor(.white.opacity(viewModel.gameName.isEmpty || viewModel.gameCost.isEmpty || viewModel.gameNotes.isEmpty ? 0.4 : 1))
                                .font(.system(size: 14, weight: .medium))
                                .frame(height: 40)
                                .frame(maxWidth: .infinity)
                                .background(RoundedRectangle(cornerRadius: 10).fill(viewModel.gameName.isEmpty || viewModel.gameCost.isEmpty || viewModel.gameNotes.isEmpty ? .black : Color("prim")))
                        })
                        .padding(.top)
                        .disabled(viewModel.gameName.isEmpty || viewModel.gameCost.isEmpty || viewModel.gameNotes.isEmpty ? true : false)
                    }
                    .padding(1)
                }
            }
            .padding()
        }
    }
}

#Preview {
    NewGameView(viewModel: GameViewModel())
}
