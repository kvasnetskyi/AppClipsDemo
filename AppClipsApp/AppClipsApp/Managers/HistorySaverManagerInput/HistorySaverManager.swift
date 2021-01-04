//
//  HistorySaverModel.swift
//  AppClipsApp
//
//  Created by Артём Кваснецкий on 23.11.2020.
//

import Foundation

class HistorySaverManager: HistorySaverManagerInput {
    // MARK: - Private Properties
    private let sharedUserDefaults: UserDefaults = {
        guard let userDefaults = UserDefaults(
                suiteName: "group.AppClipsApp.appClipMigration") else {
            fatalError()
        }
        
        return userDefaults
    }()
    
    // MARK: - Public Methods
    func saveHistory(with character: Character?) -> isHistorySaved {
        guard let character = character else { return false }
        
        guard var migratedDataArray = getCharacters() else {
            let newDataArray = [character]
            sharedUserDefaults.setValue(
                try? PropertyListEncoder().encode(newDataArray),
                forKey: "charactersHistory")
            
            return true
        }
        
        migratedDataArray.append(character)
        let newDataArray = uniq(array: migratedDataArray)
        sharedUserDefaults.set(
            try? PropertyListEncoder().encode(newDataArray),
            forKey: "charactersHistory")
        
        return true
    }
    
    func getCharacters() -> [Character]? {
        guard let migratedData = sharedUserDefaults.value(forKey: "charactersHistory") as? Data,
              let migratedDataArray = try? PropertyListDecoder().decode(
                Array<Character>.self,
                from: migratedData) else {
            
            return nil
        }
        
        return migratedDataArray
    }
}

// MARK: - Fileprivate Methods
extension HistorySaverManager {
    fileprivate func uniq(array: [Character]) -> [Character] {
        let orderedSet = NSOrderedSet(array: array)
        return orderedSet.array as! [Character]
    }
}
