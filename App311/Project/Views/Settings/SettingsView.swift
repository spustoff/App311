//
//  SettingsView.swift
//  App311
//
//  Created by IGOR on 28/12/2023.
//

import SwiftUI
import StoreKit

struct SettingsView: View {
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Text("Settings")
                    .foregroundColor(.white)
                    .font(.system(size: 26, weight: .bold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Button(action: {
                    
                    SKStoreReviewController.requestReview()
                    
                }, label: {
                    
                    HStack {
                        
                        Text("Rate app")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .semibold))
                        
                        Spacer()
                        
                        Image(systemName: "star.fill")
                            .foregroundColor(.blue)
                            .font(.system(size: 16, weight: .regular))
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg2")))
                })
                
                Button(action: {
                    
                    guard let url = URL(string: "https://docs.google.com/document/d/1ePDB3n_ge8Vu82bpdm7xxsyVIQ69p48RCBGZQavfqiQ/edit?usp=sharing") else { return }
                    
                    UIApplication.shared.open(url)
                    
                }, label: {
                    
                    HStack {
                        
                        Text("Usage policy")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .semibold))
                        
                        Spacer()
                        
                        Image(systemName: "doc.fill")
                            .foregroundColor(.blue)
                            .font(.system(size: 16, weight: .regular))
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg2")))
                })
                
                Spacer()
                
            }
            .padding()
        }
    }
}


#Preview {
    SettingsView()
}
