//
//  NetworkManager.swift
//  AppClipsApp
//
//  Created by Артём Кваснецкий on 16.11.2020.
//

import Combine
import Foundation

class NetworkManager {
    // MARK: - Private Lazy Properties
    private lazy var defaultSession: URLSession = {
        let config = URLSessionConfiguration.default
        return URLSession(configuration: config, delegate: nil, delegateQueue: nil)
    }()
    
    // MARK: - Public Methods
    func resumeTask(with request: URLRequest,
                                _ completion: @escaping (Result<Data, Error>) -> Void) {

        let urlSession = self.defaultSession

        let task = urlSession.dataTask(with: request) { (data, response, error) in
            guard let error = error else {
                guard let response = response as? HTTPURLResponse,
                      let data = data else { fatalError() }

                switch response.statusCode {
                case 200...399:
                    DispatchQueue.main.async {
                        completion(.success(data))
                    }

                default: fatalError()
                }

                return
            }

            DispatchQueue.main.async {
                completion(.failure(error))
            }
        }

        task.resume()
    }

    /*
    func resume(with url: URLRequest) -> AnyPublisher<Data, Error> {
        let api = CharactersAPI()
        guard let url = api.components.url else { fatalError() }
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .tryMap { output in
                guard let response = output.response as? HTTPURLResponse else { fatalError() }
                
                switch response.statusCode {
                case 200...399:
                    return output.data
                    
                default: fatalError()
                }
            }
            .eraseToAnyPublisher()
    }
    */
}
