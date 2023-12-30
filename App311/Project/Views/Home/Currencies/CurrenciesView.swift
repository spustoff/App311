//
//  CurrenciesView.swift
//  App311
//
//  Created by IGOR on 28/12/2023.
//

import SwiftUI

struct CurrenciesView: View {
    
    @StateObject var viewModel = GameViewModel()
    @Environment(\.presentationMode) var router
    
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack(spacing: 10) {
                
                ZStack {
                    
                    Text("Currency pair")
                        .foregroundColor(.white)
                        .font(.system(size: 16, weight: .medium))
                    
                    HStack {
                        
                        Button(action: {
                            
                            router.wrappedValue.dismiss()
                            
                        }, label: {
                            
                            HStack {
                                
                                Image(systemName: "chevron.left")
                                    .foregroundColor(.blue)
                                    .font(.system(size: 18, weight: .regular))
                                
                                Text("Back")
                                    .foregroundColor(.blue)
                                    .font(.system(size: 16, weight: .regular))
                            }
                        })
                        
                        Spacer()
                    }
                }
                .padding(.bottom, 40)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack(spacing: 20) {
                    
                    ForEach(viewModel.currencies, id: \.self) { index in
                        
                        NavigationLink(destination: {
                            
                            GraphView()
                                .navigationBarBackButtonHidden()
                                .onAppear {
                                    
                                    viewModel.scurrency = index
                                }
                            
                        }, label: {
                            
                            HStack {
                                
                                Text(index)
                                    .foregroundColor(.white)
                                    .font(.system(size: 18, weight: .regular))
                                
                                Spacer()
                                
                                Text("$\(String(format: "%.f", Double(.random(in: 30...80)))).\(String(format: "%.f", Double(.random(in: 10...90))))")
                                    .foregroundColor(.white)
                                    .font(.system(size: 16, weight: .regular))
                                
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.white)
                                    .font(.system(size: 18, weight: .regular))
                            }
                        })
                        
                        RoundedRectangle(cornerRadius: 2)
                            .fill(.gray.opacity(0.2))
                            .frame(maxWidth: .infinity)
                            .frame(height: 1)
                    }
                }
                }
            }
            .padding()
        }
    }
}

#Preview {
    CurrenciesView()
}
