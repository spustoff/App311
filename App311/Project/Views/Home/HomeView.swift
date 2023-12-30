//
//  HomeView.swift
//  App311
//
//  Created by IGOR on 28/12/2023.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var viewModel = GameViewModel()
    
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Text("Hi, User!")
                    .foregroundColor(.white)
                    .font(.system(size: 26, weight: .bold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                HStack {
                    
                    VStack(alignment: .leading, spacing: 10) {
                        
                        Text("Cost account")
                            .foregroundColor(.gray)
                            .font(.system(size: 12, weight: .semibold))
                        
                        Text("$\(viewModel.accCost)")
                            .foregroundColor(.white)
                            .font(.system(size: 20, weight: .semibold))
                    }
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg2")))
                    
                    VStack(alignment: .leading, spacing: 10) {
                        
                        Text("Currency")
                            .foregroundColor(.gray)
                            .font(.system(size: 12, weight: .semibold))
                        
                        NavigationLink(destination: {
                            
                            CurrenciesView()
                                .navigationBarBackButtonHidden()
                            
                        }, label: {
                            
                            HStack {
                                
                                if viewModel.scurrency.isEmpty {
                                    
                                    Text("EUR/USD")
                                        .foregroundColor(.white)
                                        .font(.system(size: 20, weight: .semibold))
                                    
                                } else {
                                    
                                    Text("\(viewModel.scurrency)")
                                        .foregroundColor(.white)
                                        .font(.system(size: 20, weight: .semibold))
                                    
                                }
                             
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.white)
                                    .font(.system(size: 20, weight: .semibold))
                            }
                        })
                    }
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg2")))
                }
                .padding(.vertical)
                
                Text("Your game")
                    .foregroundColor(.white)
                    .font(.system(size: 24, weight: .regular))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                VStack(alignment: .leading, spacing: 10) {
                    
                    HStack {
                        
                        Text("Nember games")
                            .foregroundColor(.gray)
                            .font(.system(size: 12, weight: .semibold))
                     
                        Spacer()
                        
                        Text("Cost")
                            .foregroundColor(.gray)
                            .font(.system(size: 12, weight: .semibold))
                    }
                    
                    HStack {
                        
                        Text("\(viewModel.numGames)")
                            .foregroundColor(.white)
                            .font(.system(size: 20, weight: .semibold))
                     
                        Spacer()
                        
                        Text("$\(viewModel.gamesCost)")
                            .foregroundColor(.white)
                            .font(.system(size: 20, weight: .semibold))
                    }
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg2")))
                
                VStack(alignment: .leading, spacing: 10) {
                    
                    HStack {
                        
                        Text("Number of items in inventory")
                            .foregroundColor(.gray)
                            .font(.system(size: 12, weight: .semibold))
                     
                        Spacer()
                        
                        Text("Cost")
                            .foregroundColor(.gray)
                            .font(.system(size: 12, weight: .semibold))
                    }
                    
                    HStack {
                        
                        Text("\(viewModel.numInv)")
                            .foregroundColor(.white)
                            .font(.system(size: 20, weight: .semibold))
                     
                        Spacer()
                        
                        Text("$\(viewModel.InventoryCost)")
                            .foregroundColor(.white)
                            .font(.system(size: 20, weight: .semibold))
                    }
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg2")))
                .padding(.bottom)
                
                if viewModel.games.isEmpty {
                    
                    VStack {
                        
                        Text("No games in the library")
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
                                        
                                        Text("Windows")
                                            .foregroundColor(.gray)
                                            .font(.system(size: 12, weight: .semibold))
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
    HomeView()
}
