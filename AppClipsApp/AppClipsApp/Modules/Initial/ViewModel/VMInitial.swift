//
//  VMInitial.swift
//  AppClipsApp
//
//  Created by Артём Кваснецкий on 16.11.2020.
//

import Combine

class VMInitial: ObservableObject {
    // MARK: - Publishers
    @Published var dataDidLoaded = false
    
    // MARK: - Public Properties
    var loadingResult: CharactersResponse!
    
    // MARK: - Private Properties
    private let networkManager: CharactersInput = {
        return NetworkManager()
    }()
    
    // MARK: - Public Methods
    func getInitialData() {
        networkManager.getInitialData { [weak self] (result) in
            guard let self = self else { return }
            
            switch result {
            case .success(let data):
                self.loadingResult = data
                self.dataDidLoaded = true
                
            case .failure(let error):
                fatalError(error.localizedDescription)
            }
        }
    }
}
