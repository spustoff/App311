//
//  Not.swift
//  App311
//
//  Created by IGOR on 28/12/2023.
//

import SwiftUI
import OneSignalFramework

struct Not: View {
    
    @AppStorage("status") var status: Bool = false
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Image("Not")
                    .resizable()
                
            }
            
            VStack(spacing: 10) {
                
                Text("Don’t miss anything")
                    .foregroundColor(.white)
                    .font(.system(size: 26, weight: .bold))
                    .padding(.top)
                
                Text("Don’t miss the most userful information")
                    .foregroundColor(.gray)
                    .font(.system(size: 16, weight: .regular))
                
                Spacer()
                
                Button(action: {
                    
                    OneSignal.Notifications.requestPermission({ accepted in
                      print("User accepted notifications: \(accepted)")
                    }, fallbackToSettings: true)
                    
                }, label: {
                    
                    Text("Enable Notifications")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .regular))
                        .frame(height: 50)
                        .frame(maxWidth: .infinity)
                        .background(RoundedRectangle(cornerRadius: 25).fill(Color("prim")))
                })
                .padding()
            }
            
            VStack {
                
                HStack {
                    
                    Spacer()
                    
                    Button(action: {
                        
                        status = true
                        
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
    Not()
}
