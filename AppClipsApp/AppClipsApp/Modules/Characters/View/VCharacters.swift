//
//  VCharacters.swift
//  AppClipsApp
//
//  Created by Артём Кваснецкий on 16.11.2020.
//

import SwiftUI

struct VCharacters: View {
    // MARK: - Private Properties
    @ObservedObject private var viewModel = VMCharacters()
    
    // MARK: - Init
    init(with data: CharactersResponse?) {
        guard let data = data else { return }
        viewModel.characters = data.results
        viewModel.nextPageURL = data.info.next
    }
    
    // MARK: - Body
    var body: some View {
        List {
            ForEach(viewModel.characters, id: \.self) { (character) in
                NavigationLink(destination: VDetails(with: character)) {
                    CharacterCell(character: character)
                }
            }
            
            if viewModel.nextPageURL != nil {
                ProgressView()
                    .onAppear(perform: {
                        viewModel.loadNextPage()
                    })
            }
        }
    }
}

// MARK: - Preview Provider
struct VCharacters_Previews: PreviewProvider {
    static var previews: some View {
        VCharacters(with: nil)
    }
}
