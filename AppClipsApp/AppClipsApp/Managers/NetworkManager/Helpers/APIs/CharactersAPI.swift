//
//  CharactersAPI.swift
//  AppClipsApp
//
//  Created by Артём Кваснецкий on 16.11.2020.
//

import Foundation

struct CharactersAPI {
    // MARK: - Static Private Properties
    static private let scheme = "https"
    static private let host = "rickandmortyapi.com"
    static private let basePath = "/api/character/"
    
    // MARK: - Private Properties
    private let path: String
    
    // MARK: - Public Properties
    var components: URLComponents {
        var components = URLComponents()
        components.scheme = CharactersAPI.scheme
        components.host = CharactersAPI.host
        components.path = path
        
        return components
    }
    
    // MARK: - Init
    init(with id: Int? = nil) {
        guard let id = id else {
            path = CharactersAPI.basePath
            return
        }
        
        path = CharactersAPI.basePath + String(id)
    }
}
