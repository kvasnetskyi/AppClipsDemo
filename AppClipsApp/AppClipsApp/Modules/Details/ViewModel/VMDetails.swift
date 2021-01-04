//
//  VMDetails.swift
//  AppClipsApp
//
//  Created by Артём Кваснецкий on 17.11.2020.
//

import Foundation
import Combine

class VMDetails: ObservableObject {
    // MARK: - Publishers
    @Published var character: Character?
    @Published var isOverlayShown = false
    
    // MARK: - Public Properties
    var characterID: Int?
    var isHistorySaved = false
    
    // MARK: - Private Properties
    private let historySaver: HistorySaverManagerInput = {
        return HistorySaverManager()
    }()
    
    private let networkManager: CharactersInput = {
        return NetworkManager()
    }()
    
    // MARK: - Public Methods
    // MARK: Set Character
    func setCharacter() {
        guard let id = characterID else { return }
        networkManager.getCharacter(with: id) { [weak self] (result) in
            guard let self = self else { return }
            
            switch result {
            case .success(let character):
                self.character = character
                self.saveHistory()
                
                #if APPCLIP
                self.isOverlayShown = true
                #endif
                
            case .failure(let error):
                fatalError(error.localizedDescription)
            }
        }
    }
    
    // MARK: Save History
    func saveHistory() {
        isHistorySaved = historySaver.saveHistory(with: self.character)
    }
}
