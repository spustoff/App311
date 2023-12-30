//
//  GameView.swift
//  App311
//
//  Created by IGOR on 28/12/2023.
//

import SwiftUI

struct GameView: View {
    
    @StateObject var viewModel = GameViewModel()
    
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                NavigationLink(destination: {
                    
                    NewGameView(viewModel: viewModel)
                        .navigationBarBackButtonHidden()
                    
                }, label: {
                    
                    Image(systemName: "plus")
                        .foregroundColor(.blue)
                        .font(.system(size: 20, weight: .regular))
                        .frame(maxWidth: .infinity, alignment: .trailing)

                })
                
                Text("Games")
                    .foregroundColor(.white)
                    .font(.system(size: 26, weight: .bold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                if viewModel.games.isEmpty {
                    
                    VStack {
                        
                        Text("No games have been added")
                            .foregroundColor(.gray)
                            .font(.system(size: 16, weight: .medium))
                    }
                    .frame(maxHeight: .infinity, alignment: .center)
                    
                } else {
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        LazyVStack(spacing: 15) {
                            
                            ForEach(viewModel.games, id: \.self) { index in
                               
                                HStack {
                                    
                                    Image(index.gamePhoto ?? "")
                                        .resizable()
                                        .frame(width: 100, height: 70)
                                    
                                    VStack(alignment: .leading, spacing: 15) {

                                        Text(index.gameName ?? "")
                                            .foregroundColor(.white)
                                            .font(.system(size: 18, weight: .bold))
                                        
                                        ZStack {
                                            
                                            RoundedRectangle(cornerRadius: 5)
                                                .fill(.white.opacity(0.6))
                                                .frame(width: 100, height: 5)

                                            RoundedRectangle(cornerRadius: 5)
                                                .fill(Color("prim"))
                                                .frame(width: 130, height: 5)
                                        }
                                    }
                                    
                                    Spacer()
                                    
                                    VStack(spacing: 15) {
                                        
                                        Text("Cost")
                                            .foregroundColor(.gray)
                                            .font(.system(size: 12, weight: .semibold))
                                        
                                        Text("$\(index.gameCost)")
                                            .foregroundColor(.white)
                                            .font(.system(size: 18, weight: .semibold))
                                    }
                                }
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg2")))
                            }
                        }
                    }
                }
            }
            .padding()
        }
        .onAppear {
            
            viewModel.fetchGames()
        }
    }
}

#Preview {
    GameView()
}
