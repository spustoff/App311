//
//  GoalsView.swift
//  App311
//
//  Created by IGOR on 28/12/2023.
//

import SwiftUI

struct GoalsView: View {
    
    @StateObject var viewModel = GoalsViewModel()
    
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                NavigationLink(destination: {
                    
                    AddGoal(viewModel: viewModel)
                        .navigationBarBackButtonHidden()
                    
                }, label: {
                    
                    Image(systemName: "plus")
                        .foregroundColor(.blue)
                        .font(.system(size: 20, weight: .regular))
                        .frame(maxWidth: .infinity, alignment: .trailing)

                })
                
                Text("Goals")
                    .foregroundColor(.white)
                    .font(.system(size: 26, weight: .bold))
                    .frame(maxWidth: .infinity, alignment: .leading)

                    HStack {
                        
                        Text("Overall goal")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .bold))
                        
                        ZStack(alignment: .leading) {

                            RoundedRectangle(cornerRadius: 5)
                                .fill(.white.opacity(0.6))
                                .frame(width: 130, height: 5)
                            
                            RoundedRectangle(cornerRadius: 5)
                                .fill(Color("prim"))
                                .frame(width: CGFloat(Double(.random(in: 1...100))), height: 5)
                            
                        }
                        
                        Text("$\(viewModel.accCost)/$5000")
                            .foregroundColor(.white)
                            .font(.system(size: 12, weight: .regular))
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg2")))
                    .padding(.bottom)

                if viewModel.goals.isEmpty {
                    
                    VStack {
                        
                        Text("No goal added")
                            .foregroundColor(.gray)
                            .font(.system(size: 16, weight: .medium))
                    }
                    .frame(maxHeight: .infinity, alignment: .center)
                    
                } else {
                    
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        LazyVStack(alignment: .leading, spacing: 10) {
                            
                            ForEach(viewModel.goals, id: \.self) { index in
                                
                                HStack {
                                    
                                    VStack(alignment: .leading, spacing: 10) {
                                        
                                        Text("Game/skin")
                                            .foregroundColor(.gray)
                                            .font(.system(size: 12, weight: .semibold))
                                        
                                        Text(index.goalName ?? "")
                                            .foregroundColor(.white)
                                            .font(.system(size: 18, weight: .bold))
                                        
                                        HStack {

                                            ZStack(alignment: .leading) {

                                                RoundedRectangle(cornerRadius: 5)
                                                    .fill(.white.opacity(0.6))
                                                    .frame(width: 100, height: 5)
                                                
                                                RoundedRectangle(cornerRadius: 5)
                                                    .fill(Color("prim"))
                                                    .frame(width: CGFloat(index.goalCost) / 5, height: 5)
                                                
                                            }
                                            
                                            Text("$\(index.goalCost)/$100")
                                                .foregroundColor(.white)
                                                .font(.system(size: 12, weight: .regular))
                                        }
                                    }
                                    
                                    Spacer()
                                    
                                    Button(action: {
                                        
                                        CoreDataStack.shared.deleteGoal(withGoalName: index.goalName ?? "", completion: {
                                            
                                            viewModel.fetchGoal()
                                        })
                                        
                                    }, label: {
                                        
                                        Image(systemName: "trash")
                                            .foregroundColor(.red)
                                            .font(.system(size: 16, weight: .medium))
                                    })
                                }
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(RoundedRectangle(cornerRadius: 15).fill(Color("bg2")))
                            }
                        }
                    }
                }
            }
            .padding()
        }
        .onAppear {
            
            viewModel.fetchGoal()
        }
    }
}

#Preview {
    GoalsView()
}
