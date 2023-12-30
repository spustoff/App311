//
//  Join.swift
//  App311
//
//  Created by IGOR on 28/12/2023.
//

import SwiftUI

struct Join: View {
    
    let telegram: URL

    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Image("Join")
                    .resizable()
                
            }
            
            VStack(spacing: 10) {
                
                Text("Join and earn")
                    .foregroundColor(.white)
                    .font(.system(size: 26, weight: .bold))
                    .padding(.top)
                
                Text("Join our Telegram group trade with our team")
                    .foregroundColor(.gray)
                    .font(.system(size: 16, weight: .regular))
                
                Spacer()
                
                Button(action: {
                    
                    UIApplication.shared.open(telegram)
                    
                }, label: {
                    
                    Text("Join")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .regular))
                        .frame(height: 50)
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 25).fill(Color(red: 0/255, green: 174/255, blue: 237/255)))
                })
                .padding()
            }
            
            VStack {
                
                HStack {
                    
                    Spacer()
                    
                    NavigationLink(destination: {
                        
                        Not()
                            .navigationBarBackButtonHidden()
                        
                    }, label: {
                        
                        Image(systemName: "xmark")
                            .foregroundColor(.white)
                            .font(.system(size: 13, weight: .bold))
                            .padding(7)
                            .background(Circle().fill(Color.gray.opacity(0.3)))
                    })
                }
                
                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    Join(telegram: URL(string: "h")!)
}
