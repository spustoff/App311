//
//  InventoryViewModel.swift
//  App311
//
//  Created by IGOR on 29/12/2023.
//

import SwiftUI
import CoreData

final class InventoryViewModel: ObservableObject {
    
    @AppStorage("numGames") var numGames: Int = 0
    @AppStorage("gamesCost") var gamesCost: Int = 0
    @AppStorage("numInv") var numInv: Int = 0
    @AppStorage("InventoryCost") var InventoryCost: Int = 0
    @AppStorage("accCost") var accCost: Int = 0
    
    @Published var have_game: [String] = ["All", "Dark Souls 3", "The Elser Scrolls", "Witcher 3", "Tiny Bunny", "Counter-Strike 2", "Saint Row 4"]
    @Published var currentHGame = "All"
    
    @Published var have_inv: [String] = ["MP7", "Shadow Daggers", "Karambit", "Nova", "P250", "P250S", "MP9", "Operation Bravo"]
    @Published var currentHInv = ""

    @Published var invName: String = ""
    @Published var invComment: String = ""
    @Published var invPhoto: String = ""
    @Published var invCost: String = ""
    @Published var selectedGame: String = ""
    @AppStorage("CreatedGames") var CreatedGames: [String] = []
    
    @Published var invertories: [InventoryModel] = []
    @Published var selectedInventory: InventoryModel?
    @Published var isDetail: Bool = false

    func addInventory(currentGame: String, completion: @escaping () -> (Void)) {
        
        CoreDataStack.shared.modelName = "InventoryModel"
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let sub = NSEntityDescription.insertNewObject(forEntityName: "InventoryModel", into: context) as! InventoryModel
        
        sub.invName = invName
        sub.invComment = invComment
        sub.invPhoto = invPhoto
        sub.invCost = Int16(Int(invCost) ?? 0)
        sub.currentGame = currentGame

        CoreDataStack.shared.saveContext()
        
        completion()
    }
    
    func fetchInventory() {
        
        CoreDataStack.shared.modelName = "InventoryModel"
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<InventoryModel>(entityName: "InventoryModel")

        do {
            
            let branch = try context.fetch(fetchRequest)
            
            self.invertories = branch
            
        } catch let error as NSError {
            
            print("Error fetching persons: \(error), \(error.userInfo)")
            
            self.invertories = []
        }
    }

    
}
