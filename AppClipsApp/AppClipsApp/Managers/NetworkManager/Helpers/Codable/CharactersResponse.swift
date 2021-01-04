//
//  CharactersResponse.swift
//  AppClipsApp
//
//  Created by Артём Кваснецкий on 16.11.2020.
//

import Foundation

struct CharactersResponse: Codable {
    let info: PagesInfo
    let results: [Character]
}
