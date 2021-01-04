//
//  VHistory.swift
//  AppClipsApp
//
//  Created by Артём Кваснецкий on 20.11.2020.
//

import SwiftUI

struct VHistory: View {
    // MARK: - Private Properties
    @ObservedObject private var viewModel = VMHistory()
    
    // MARK: - Body
    var body: some View {
        List {
            ForEach(viewModel.characters, id: \.self) { (character) in
                CharacterCell(character: character)
            }
        }
        .onAppear(perform: {
            viewModel.setCharactersHistory()
        })
    }
}

// MARK: - Preview Provider
struct VHistory_Previews: PreviewProvider {
    static var previews: some View {
        VHistory()
    }
}
