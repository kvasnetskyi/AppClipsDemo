//
//  NetworkManager+Characters.swift
//  AppClipsApp
//
//  Created by Артём Кваснецкий on 16.11.2020.
//

import Foundation
import Combine

extension NetworkManager: CharactersInput {
    // MARK: - Get Initial Data
    func getInitialData(_ completion: @escaping (Result<CharactersResponse, Error>) -> Void) {
        let api = CharactersAPI()
        guard let url = api.components.url else { fatalError() }
        
        getPage(from: url, completion)
    }
    
    // MARK: - Get Page
    func getPage(from url: URL, _ completion: @escaping (Result<CharactersResponse, Error>) -> Void) {
        var request = URLRequest(url: url)
        request.httpMethod = "GET"

        resumeTask(with: request) { (result) in
            switch result {
            case .success(let data):
                let response = try! JSONDecoder().decode(CharactersResponse.self, from: data)
                completion(.success(response))

            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    // MARK: - Get Character
    func getCharacter(with id: Int, _ completion: @escaping (Result<Character, Error>) -> Void) {
        let api = CharactersAPI(with: id)
        guard let url = api.components.url else { fatalError() }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        resumeTask(with: request) { (result) in
            switch result {
            case .success(let data):
                let response = try! JSONDecoder().decode(Character.self, from: data)
                completion(.success(response))
                
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    /*
    // MARK: - Get Initial Data
    func getInitialData() -> AnyPublisher<CharactersResponse, Error> {
        let api = CharactersAPI()
        guard let url = api.components.url else { fatalError() }
        
        return getPage(from: url)
    }
    
    // MARK: - Get Page
    func getPage(from url: URL) -> AnyPublisher<CharactersResponse, Error> {
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        return resume(with: request)
            .decode(type: CharactersResponse.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    // MARK: - Get Character
    func getCharacter(from url: URL) -> AnyPublisher<Character, Error> {
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        return resume(with: request)
            .decode(type: Character.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    */
}
