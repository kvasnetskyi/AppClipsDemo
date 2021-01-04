//
//  ImageLoader.swift
//  AppClipsApp
//
//  Created by Артём Кваснецкий on 16.11.2020.
//

import Combine
import Foundation
import UIKit.UIImage

class ImageLoader: ObservableObject {
    // MARK: - Publishers
    @Published var image: UIImage?
    
    // MARK: - Private Properties
    private let url: URL
    private var cancellable: AnyCancellable?
    
    // MARK: - Init
    init(with url: URL) {
        self.url = url
    }
    
    // MARK: - Deinit
    deinit {
        cancel()
    }
    
    func load() {
        cancellable = URLSession.shared.dataTaskPublisher(for: url)
            .map { UIImage(data: $0.data) }
            .replaceError(with: nil)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] in self?.image = $0 }
    }
    
    func cancel() {
        cancellable?.cancel()
    }
}
