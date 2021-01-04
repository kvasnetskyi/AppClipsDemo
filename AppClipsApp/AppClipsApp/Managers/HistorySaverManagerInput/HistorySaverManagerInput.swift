//
//  HistorySaverManagerInput.swift
//  AppClipsApp
//
//  Created by Артём Кваснецкий on 23.11.2020.
//

import Foundation

// MARK: - Typealias
typealias isHistorySaved = Bool

// MARK: - Protocol
protocol HistorySaverManagerInput {
    func saveHistory(with character: Character?) -> isHistorySaved
    func getCharacters() -> [Character]?
}
