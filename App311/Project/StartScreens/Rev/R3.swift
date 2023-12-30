//
//  R3.swift
//  App311
//
//  Created by IGOR on 28/12/2023.
//

import SwiftUI

struct R3: View {
    
    @AppStorage("status") var status: Bool = false
    
    var body: some View {
 
        ZStack {
            
            Color("bgo")
                .ignoresSafeArea()
            
            VStack {
                
                Image("R3")
                    .resizable()
                    .ignoresSafeArea()
                
            }
            
            VStack(spacing: 10) {
                
                Text("Save up for your goals")
                    .foregroundColor(.white)
                    .font(.system(size: 26, weight: .bold))
                    .padding(.top)
                
                Text("Convenient calculation of common goals")
                    .foregroundColor(.gray)
                    .font(.system(size: 16, weight: .regular))
                
                Spacer()
                
                Button(action: {
                    
                    status = true
                    
                }, label: {
                    
                    Text("Finish")
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
    R3()
}
