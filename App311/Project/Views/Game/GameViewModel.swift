//
//  GameViewModel.swift
//  App311
//
//  Created by IGOR on 28/12/2023.
//

import SwiftUI
import CoreData

final class GameViewModel: ObservableObject {
    
    @Published var currencies: [String] = ["EUR/USD", "USD/JPY", "AUD/USD", "USD/CHF", "EUR/JPY", "EUR/GBP"]
    @Published var current_currency = ""
    @AppStorage("scurrency") var scurrency = ""
    @AppStorage("numGames") var numGames: Int = 0
    @AppStorage("gamesCost") var gamesCost: Int = 0
    @AppStorage("numInv") var numInv: Int = 0
    @AppStorage("InventoryCost") var InventoryCost: Int = 0
    @AppStorage("accCost") var accCost: Int = 0

    @Published var gameName: String = ""
    @Published var gamePhoto: String = ""
    @Published var gameNotes: String = ""
    @Published var gameCost: String = ""
    @AppStorage("CreatedGames") var CreatedGames: [String] = []
    
    @Published var games: [GameModel] = []
    @Published var selectedGame: GameModel?
    @Published var isDetail: Bool = false
    
    @Published var have_game: [String] = ["Dark Souls 3", "The Elser Scrolls", "Witcher 3", "Tiny Bunny", "Counter-Strike 2", "Saint Row 4"]
    @Published var currentHGame = ""

    func addGame(completion: @escaping () -> (Void)) {
        
        CoreDataStack.shared.modelName = "GameModel"
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let sub = NSEntityDescription.insertNewObject(forEntityName: "GameModel", into: context) as! GameModel
        
        sub.gameName = gameName
        sub.gamePhoto = gamePhoto
        sub.gameNotes = gameNotes
        sub.gameCost = Int16(Int(gameCost) ?? 0)
        
        CoreDataStack.shared.saveContext()
        
        completion()
    }
    
    func fetchGames() {
        
        CoreDataStack.shared.modelName = "GameModel"
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<GameModel>(entityName: "GameModel")

        do {
            
            let branch = try context.fetch(fetchRequest)
            
            self.games = branch
            
        } catch let error as NSError {
            
            print("Error fetching persons: \(error), \(error.userInfo)")
            
            self.games = []
        }
    }
}

