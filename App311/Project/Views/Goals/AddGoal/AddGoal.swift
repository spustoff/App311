//
//  AddGoal.swift
//  App311
//
//  Created by IGOR on 28/12/2023.
//

import SwiftUI

struct AddGoal: View {
    
    @StateObject var viewModel: GoalsViewModel
    @Environment(\.presentationMode) var router
    
    var body: some View {

        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("New game")
                        .foregroundColor(.white)
                        .font(.system(size: 16, weight: .regular))
                    
                    HStack {
                        
                        Button(action: {
                            
                            router.wrappedValue.dismiss()
                            
                        }, label: {
                            
                            HStack {
                                
                                Image(systemName: "chevron.left")
                                    .foregroundColor(.blue)
                                    .font(.system(size: 16, weight: .regular))
                                
                                Text("Back")
                                    .foregroundColor(.blue)
                                    .font(.system(size: 14, weight: .regular))
                                
                                Spacer()
                            }
                        })
                    }
                }
                .padding(.bottom, 40)

                ScrollView(.vertical, showsIndicators: false) {
                    
                    LazyVStack {
                        
                        ZStack(alignment: .leading, content: {
                            
                            HStack{
                                
                                Text("Name")
                                    .foregroundColor(.white)
                                    .font(.system(size: 13, weight: .medium))
                                
                                Text("Enter")
                                    .foregroundColor(viewModel.goalName.isEmpty ? .gray : .white)
                                    .font(.system(size: 13, weight: .medium))
                                    .opacity(viewModel.goalName.isEmpty ? 1 : 0)
                                
                            }
                            
                            TextField("", text: $viewModel.goalName)
                                .foregroundColor(.white)
                                .font(.system(size: 13, weight: .medium))
                                .padding(.leading, 43)
                            
                        })
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 10).stroke(.white))
                        
                        ZStack(alignment: .leading, content: {
                            
                            HStack{
                                
                                Text("Cost")
                                    .foregroundColor(.white)
                                    .font(.system(size: 13, weight: .medium))
                                
                                Text("60")
                                    .foregroundColor(viewModel.goalCost.isEmpty ? .gray : .white)
                                    .font(.system(size: 13, weight: .medium))
                                    .opacity(viewModel.goalCost.isEmpty ? 1 : 0)
                                
                            }
                            
                            TextField("", text: $viewModel.goalCost)
                                .foregroundColor(.white)
                                .font(.system(size: 13, weight: .medium))
                                .padding(.leading, 36)
                            
                        })
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 10).stroke(.white))
                        .padding(.bottom)
                        
                        Button(action: {
                            
                            viewModel.overallGoal += Int(viewModel.goalCost) ?? 0
                            
                            viewModel.addGoal(completion: {
                                
                                viewModel.goalName = ""
                                viewModel.goalCost = ""
                            })
                            
                            router.wrappedValue.dismiss()
                            
                        }, label: {
                            
                            Text("Add")
                                .foregroundColor(.white.opacity(viewModel.goalName.isEmpty || viewModel.goalCost.isEmpty ? 0.4 : 1))
                                .font(.system(size: 14, weight: .medium))
                                .frame(height: 40)
                                .frame(maxWidth: .infinity)
                                .background(RoundedRectangle(cornerRadius: 10).fill(viewModel.goalName.isEmpty || viewModel.goalCost.isEmpty ? .black : Color("prim")))
                        })
                        .padding(.top)
                        .disabled(viewModel.goalName.isEmpty || viewModel.goalCost.isEmpty ? true : false)
                    }
                    .padding(1)
                }
            }
            .padding()
        }
    }
}

#Preview {
    AddGoal(viewModel: GoalsViewModel())
}
