//
//  VMHistory.swift
//  AppClipsApp
//
//  Created by Артём Кваснецкий on 20.11.2020.
//

import Foundation

class VMHistory: ObservableObject {
    // MARK: - Publishers
    @Published var characters = [Character]()
    
    // MARK: - Private Properties
    private let historySaver: HistorySaverManagerInput = {
        return HistorySaverManager()
    }()
    
    // MARK: - Public Methods
    func setCharactersHistory() {
        guard let characters = historySaver.getCharacters() else { return }
        self.characters = characters
    }
}
