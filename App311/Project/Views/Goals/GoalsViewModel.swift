//
//  GoalsViewModel.swift
//  App311
//
//  Created by IGOR on 28/12/2023.
//

import SwiftUI
import CoreData

final class GoalsViewModel: ObservableObject {

    @AppStorage("numGames") var numGames: Int = 0
    @AppStorage("gamesCost") var gamesCost: Int = 0
    @AppStorage("numInv") var numInv: Int = 0
    @AppStorage("InventoryCost") var InventoryCost: Int = 0
    @AppStorage("accCost") var accCost: Int = 0
    
    @AppStorage("overallGoal") var overallGoal: Int = 0
    
    @Published var goalName: String = ""
    @Published var goalCost: String = ""

    @Published var goals: [GoalModel] = []
    @Published var selectedGoal: GoalModel?
    @Published var isDetail: Bool = false

    func addGoal(completion: @escaping () -> (Void)) {
        
        CoreDataStack.shared.modelName = "GoalModel"
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let sub = NSEntityDescription.insertNewObject(forEntityName: "GoalModel", into: context) as! GoalModel

        sub.goalName = goalName
        sub.goalCost = Int16(Int(goalCost) ?? 0)
        
        CoreDataStack.shared.saveContext()
        
        completion()
    }
    
    func fetchGoal() {
        
        CoreDataStack.shared.modelName = "GoalModel"
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<GoalModel>(entityName: "GoalModel")

        do {
            
            let branch = try context.fetch(fetchRequest)
            
            self.goals = branch
            
        } catch let error as NSError {
            
            print("Error fetching persons: \(error), \(error.userInfo)")
            
            self.goals = []
        }
    }
}

