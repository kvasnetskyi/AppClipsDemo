//
//  VMCharacters.swift
//  AppClipsApp
//
//  Created by Артём Кваснецкий on 16.11.2020.
//

import Foundation
import Combine

class VMCharacters: ObservableObject {
    // MARK: - Publishers
    @Published var characters = [Character]()
    
    // MARK: - Public Properties
    var nextPageURL: String?
    
    // MARK: - Private Properties
    private let networkManager: CharactersInput = {
        return NetworkManager()
    }()
    
    // MARK: - Public Methods
    func loadNextPage() {
        guard let next = nextPageURL,
              let url = URL(string: next) else { return }
        
        networkManager.getPage(from: url) { [weak self] (result) in
            guard let self = self else { return }
            
            switch result {
            case .success(let data):
                self.nextPageURL = data.info.next
                self.characters.append(contentsOf: data.results)
                
            case .failure(let error):
                fatalError(error.localizedDescription)
            }
        }
    }
}
