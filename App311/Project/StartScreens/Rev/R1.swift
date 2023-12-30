//
//  R1.swift
//  App311
//
//  Created by IGOR on 28/12/2023.
//

import SwiftUI

struct R1: View {
    var body: some View {
        
        ZStack {
            
            Color("bgo")
                .ignoresSafeArea()
            
            VStack {
                
                Image("R1")
                    .resizable()
                    .ignoresSafeArea()
                
            }
            
            VStack(spacing: 10) {
                
                Text("All your games")
                    .foregroundColor(.white)
                    .font(.system(size: 26, weight: .bold))
                    .padding(.top)
                
                Text("Mine, sell, explore")
                    .foregroundColor(.gray)
                    .font(.system(size: 16, weight: .regular))
                
                Spacer()
                
                NavigationLink(destination: {
                    
                    R2()
                        .navigationBarBackButtonHidden()
                    
                }, label: {
                    
                    Text("Next")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .regular))
                        .frame(height: 50)
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 25).fill(Color("prim")))
                })
                .padding()
            }
        }
    }
}

#Preview {
    R1()
}
