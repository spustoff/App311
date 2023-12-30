//
//  InvDetail.swift
//  App311
//
//  Created by IGOR on 30/12/2023.
//

import SwiftUI

struct InvDetail: View {
    
    @StateObject var viewModel = InventoryViewModel()
    
    @Environment(\.presentationMode) var router
    
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Button(action: {
                    
                    router.wrappedValue.dismiss()
                    
                }, label: {
                    
                    ZStack {
                        
                        Text(viewModel.selectedInventory?.invName ?? "")
                            .foregroundColor(.white)
                        
                        HStack {
                            
                            Image(systemName: "chevron.left")
                                .foregroundColor(.white)
                                .font(.system(size: 16, weight: .medium))
                            
                            Text("Back")
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .regular))
                            
                            Spacer()
                        }
                    }
                })
                
                Image(viewModel.selectedInventory?.invPhoto ?? "")
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    HStack {
                        
                        Text("Game")
                            .foregroundColor(.white)
                            .font(.system(size: 14, weight: .medium))
                        
                        Text(viewModel.selectedInventory?.invName ?? "")
                            .foregroundColor(.white)
                            .font(.system(size: 14, weight: .regular))
                            
                        Spacer()
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg2")))
                    
                    HStack {
                        
                        Text("Cost")
                            .foregroundColor(.white.opacity(0.5))
                            .font(.system(size: 14, weight: .medium))
                        
                        Text("$\(viewModel.selectedInventory?.invCost ?? 0)")
                            .foregroundColor(.white)
                            .font(.system(size: 14, weight: .regular))
                            
                        Spacer()
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg2")))
                    
                    Text("Comments")
                        .foregroundColor(.white)
                        .font(.system(size: 18, weight: .medium))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.vertical)
                    
                    HStack {
                        
                        Text("Comment")
                            .foregroundColor(.white.opacity(0.5))
                            .font(.system(size: 14, weight: .medium))
                        
                        Text(viewModel.selectedInventory?.invComment ?? "")
                            .foregroundColor(.white)
                            .font(.system(size: 14, weight: .regular))
                            
                        Spacer()
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color("bg2")))
                }
            }
            .padding()
        }
    }
}

#Preview {
    InvDetail()
}
