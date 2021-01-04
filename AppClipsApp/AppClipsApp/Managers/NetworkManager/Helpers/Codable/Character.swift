//
//  Character.swift
//  AppClipsApp
//
//  Created by Артём Кваснецкий on 16.11.2020.
//

import Foundation

struct Character: Codable, Hashable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let image: String
}
