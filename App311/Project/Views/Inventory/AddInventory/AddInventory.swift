//
//  AddInventory.swift
//  App311
//
//  Created by IGOR on 29/12/2023.
//

import SwiftUI

struct AddInventory: View {

    @StateObject var viewModel: InventoryViewModel
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
                    
                    ForEach(viewModel.have_inv, id: \.self) { index in
                        
                        Button(action: {
                            
                            viewModel.currentHInv = index
                            viewModel.invPhoto = index
                            
                        }, label: {
                            
                                Text(index)
                                    .foregroundColor(.black)
                                    .font(.system(size: 16, weight: .regular))
                                
                        })
                    }
                    
                }, label: {
                    
                    if viewModel.currentHInv.isEmpty {
                        
                        Image(systemName: "camera.fill")
                            .frame(width: 100, height: 100)
                            .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg2")))
                            .padding()
                        
                    } else {
                        
                        Image(viewModel.currentHInv)
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
                                    .foregroundColor(viewModel.invName.isEmpty ? .gray : .white)
                                    .font(.system(size: 13, weight: .medium))
                                    .opacity(viewModel.invName.isEmpty ? 1 : 0)
                                
                            }
                            
                            TextField("", text: $viewModel.invName)
                                .foregroundColor(.white)
                                .font(.system(size: 13, weight: .medium))
                                .padding(.leading, 43)
                            
                        })
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 10).stroke(.white))
                        
                        Menu(content: {
                            
                            ForEach(viewModel.CreatedGames, id: \.self) { index in
                                
                                Button(action: {
                                    
                                    viewModel.selectedGame = index
                                    
                                }, label: {
                                   
                                    Text(index)
                                        .foregroundColor(.black)
                                        .font(.system(size: 16, weight: .regular))
                
                                })
                            }

                        }, label: {
                            
                            HStack {
                                
                                Text("Game")
                                    .foregroundColor(.white)
                                    .font(.system(size: 13, weight: .medium))
                                
                                Text(viewModel.selectedGame)
                                    .foregroundColor(.white)
                                    .font(.system(size: 13, weight: .medium))
                             
                                Spacer()
                                
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.white)
                                    .font(.system(size: 16, weight: .medium))
                            }
                        })
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 10).stroke(.white))
                        .padding(.bottom)
                            
                        ZStack(alignment: .leading, content: {
                            
                            HStack{
                                
                                Text("Cost")
                                    .foregroundColor(.white)
                                    .font(.system(size: 13, weight: .medium))
                                
                                Text("$")
                                    .foregroundColor(viewModel.invCost.isEmpty ? .gray : .white)
                                    .font(.system(size: 13, weight: .medium))
                                    .opacity(viewModel.invCost.isEmpty ? 1 : 0)
                                
                            }
                            
                            TextField("", text: $viewModel.invCost)
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
                                    .foregroundColor(viewModel.invComment.isEmpty ? .gray : .white)
                                    .font(.system(size: 13, weight: .medium))
                                    .opacity(viewModel.invComment.isEmpty ? 1 : 0)
                                
                            }
                            
                            TextField("", text: $viewModel.invComment)
                                .foregroundColor(.white)
                                .font(.system(size: 13, weight: .medium))
                                .padding(.leading, 68)
                            
                        })
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 10).stroke(.white))
                        .padding(.bottom)
                        
                        Button(action: {
                            
                            viewModel.InventoryCost += Int(viewModel.invCost) ?? 0
                            viewModel.numInv += 1
                            viewModel.accCost += Int(viewModel.invCost) ?? 0
                            
                            viewModel.addInventory(currentGame: viewModel.selectedGame, completion: {
                                
                                viewModel.invName = ""
                                viewModel.invCost = ""
                                viewModel.invComment = ""
                            })
           
                            router.wrappedValue.dismiss()
                            
                        }, label: {
                            
                            Text("Save")
                                .foregroundColor(.white.opacity(viewModel.invName.isEmpty || viewModel.invCost.isEmpty || viewModel.invComment.isEmpty ? 0.4 : 1))
                                .font(.system(size: 14, weight: .medium))
                                .frame(height: 40)
                                .frame(maxWidth: .infinity)
                                .background(RoundedRectangle(cornerRadius: 10).fill(viewModel.invName.isEmpty || viewModel.invCost.isEmpty || viewModel.invComment.isEmpty ? .black : Color("prim")))
                        })
                        .padding(.top)
                        .disabled(viewModel.invName.isEmpty || viewModel.invCost.isEmpty || viewModel.invComment.isEmpty ? true : false)
                    }
                    .padding(1)
                }
            }
            .padding()
        }
    }
}

#Preview {
    AddInventory(viewModel: InventoryViewModel())
}
