//
//  U1.swift
//  App311
//
//  Created by IGOR on 28/12/2023.
//

import SwiftUI

struct U1: View {
    
    let telegram: URL
    let isTelegram: Bool
    
    var body: some View {

        ZStack {
            
            Color("bgo")
                .ignoresSafeArea()
            
            VStack {
                
                Image("U1")
                    .resizable()
                
            }
            
            VStack(spacing: 10) {
                
                Text("Increase your profits")
                    .foregroundColor(.white)
                    .font(.system(size: 26, weight: .bold))
                    .padding(.top)
                
                Text("Financial control")
                    .foregroundColor(.gray)
                    .font(.system(size: 16, weight: .regular))
                
                Spacer()
                
                NavigationLink(destination: {
                    
                    Reviews(telegram: telegram, isTelegram: isTelegram)
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
    U1(telegram: URL(string: "h")!, isTelegram: false)
}
