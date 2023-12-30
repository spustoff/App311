//
//  LoadingView.swift
//  App311
//
//  Created by IGOR on 28/12/2023.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
  
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()

            Image("LLogo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 150, height: 150)
            
            VStack {
                
                Spacer()
                
                ProgressView()
                    .padding()
            }
        }
    }
}

#Preview {
    LoadingView()
}
