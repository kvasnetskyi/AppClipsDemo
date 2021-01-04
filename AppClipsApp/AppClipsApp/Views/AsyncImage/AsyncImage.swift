//
//  AsyncImage.swift
//  AppClipsApp
//
//  Created by Артём Кваснецкий on 16.11.2020.
//

import SwiftUI

struct AsyncImage<T: View>: View {
    // MARK: - State Object
    @StateObject private var imageLoader: ImageLoader
    
    // MARK: - Private Properties
    private let placeholder: T
    
    // MARK: - Init
    init(url: String, placeholder: T) {
        guard let url = URL(string: url) else { fatalError() }
        
        self.placeholder = placeholder
        _imageLoader = StateObject(wrappedValue: ImageLoader(
                                    with: url))
    }
    
    // MARK: - Body
    var body: some View {
        setContentView()
            .onAppear(perform: imageLoader.load)
    }
    
    // MARK: - Fileprivate Methods
    fileprivate func setContentView() -> some View {
        return Group {
            if let image = imageLoader.image {
                Image(uiImage: image)
                    .resizable()
            } else {
                placeholder
            }
        }
    }
}

// MARK: - Preview Provider
struct AsyncImage_Previews: PreviewProvider {
    static var previews: some View {
        AsyncImage(url: "",
                   placeholder: Image(uiImage: #imageLiteral(resourceName: "Placeholder")))
    }
}
