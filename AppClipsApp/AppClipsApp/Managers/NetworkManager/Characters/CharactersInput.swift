//
//  CharactersInput.swift
//  AppClipsApp
//
//  Created by Артём Кваснецкий on 16.11.2020.
//

import Combine
import Foundation

protocol CharactersInput {
    func getInitialData(_ completion: @escaping (Result<CharactersResponse, Error>) -> Void)
    func getPage(from url: URL, _ completion: @escaping (Result<CharactersResponse, Error>) -> Void)
    func getCharacter(with id: Int, _ completion: @escaping (Result<Character, Error>) -> Void)
}
