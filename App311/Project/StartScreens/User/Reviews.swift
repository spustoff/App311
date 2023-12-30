//
//  Reviews.swift
//  App311
//
//  Created by IGOR on 28/12/2023.
//

import SwiftUI
import StoreKit

struct Reviews: View {
    
    let telegram: URL
    let isTelegram: Bool
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()

            VStack(spacing: 10) {
                
                Text("Rate our app in the AppStore")
                    .foregroundColor(.white)
                    .font(.system(size: 26, weight: .bold))
                    .multilineTextAlignment(.center)
                    .padding(.top)
                    .padding(.horizontal, 30)
                
                Text("Help make the app even better")
                    .foregroundColor(.gray)
                    .font(.system(size: 16, weight: .regular))
                
                Image("Reviews")
                    .resizable()
                                
                NavigationLink(destination: {
                    
                    if isTelegram == true {
                        
                        Join(telegram: telegram)
                            .navigationBarBackButtonHidden()
                        
                    } else if isTelegram == false {
                        
                        Not()
                            .navigationBarBackButtonHidden()
                    }
                    
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
        .onAppear {
            
            SKStoreReviewController.requestReview()
        }
    }
}

#Preview {
    Reviews(telegram: URL(string: "h")!, isTelegram: false)
}
