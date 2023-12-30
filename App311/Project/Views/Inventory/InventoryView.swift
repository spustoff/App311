//
//  InventoryView.swift
//  App311
//
//  Created by IGOR on 28/12/2023.
//

import SwiftUI

struct InventoryView: View {
    
    @StateObject var viewModel = InventoryViewModel()
    
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                NavigationLink(destination: {
                    
                    AddInventory(viewModel: viewModel)
                        .navigationBarBackButtonHidden()
                    
                }, label: {
                    
                    Image(systemName: "plus")
                        .foregroundColor(.blue)
                        .font(.system(size: 16, weight: .regular))
                        .frame(maxWidth: .infinity, alignment: .trailing)

                })
                
                Text("Inventory")
                    .foregroundColor(.white)
                    .font(.system(size: 26, weight: .bold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    
                    LazyHStack {
                        
                        ForEach(viewModel.have_game, id: \.self) { index in
                        
                            Button(action: {
                                
                                viewModel.currentHGame = index
                                
                            }, label: {
                                
                                Text(index)
                                    .foregroundColor(.white)
                                    .font(.system(size: 13, weight: .medium))
                                    .padding()
                                    .background(RoundedRectangle(cornerRadius: 10).fill(Color("prim")))
                                    .opacity(viewModel.currentHGame == index ? 1 : 0.3)
                            })
                        }
                    }
                }
                .frame(height: 70)
                
                if viewModel.invertories.isEmpty {
                    
                    VStack {
                        
                        Text("Inventory is empty")
                            .foregroundColor(.gray)
                            .font(.system(size: 16, weight: .medium))
                        
                    }
                    .frame(maxHeight: .infinity, alignment: .center)
                    
                } else {
                    
                    ScrollView(.vertical, showsIndicators: false) {
                    
                        LazyVStack {
                            
                            ForEach(viewModel.invertories, id: \.self) { index in
                            
                                NavigationLink(destination: {
                                    
                                    InvDetail()
                                        .navigationBarBackButtonHidden()
                                    
                                }, label: {
                                    
                                    HStack {
                                        
                                        Image(index.invPhoto ?? "")
                                        
                                        VStack {
                                            
                                            Text(index.invName ?? "")
                                                .foregroundColor(.white)
                                                .font(.system(size: 18, weight: .medium))
                                            
                                            Text(index.currentGame ?? "")
                                                .foregroundColor(.gray)
                                                .font(.system(size: 13, weight: .medium))
                                        }
                                        
                                        Spacer()
                                        
                                        Text("$\(index.invCost)")
                                            .foregroundColor(.white)
                                            .font(.system(size: 16, weight: .medium))
                                    }
                                })
                                .onTapGesture {
                                    
                                    viewModel.selectedInventory = index
                                }
                                
                                RoundedRectangle(cornerRadius: 2)
                                    .fill(.gray.opacity(0.3))
                                    .frame(maxWidth: .infinity)
                                    .frame(height: 1)
                            }
                        }
                    }
                }
                
                Spacer()
            }
            .padding()
        }
        .onAppear {
            
            viewModel.fetchInventory()
        }
    }
}

#Preview {
    InventoryView()
}
