//
//  CharacterCell.swift
//  AppClipsApp
//
//  Created by Артём Кваснецкий on 16.11.2020.
//

import SwiftUI

struct CharacterCell: View {
    // MARK: - Public Properties
    let character: Character
    
    // MARK: - Body
    var body: some View {
        HStack(spacing: CGFloat.zero) {
            AsyncImage(url: character.image,
                       placeholder: Image(uiImage: #imageLiteral(resourceName: "Placeholder"))
                        .resizable())
                .frame(width: 50,
                       height: 50,
                       alignment: .center)
                .clipShape(Circle())
                .padding()
            
            VStack(alignment: .leading, spacing: 5) {
                Text(character.name)
                    .fontWeight(.bold)
                    .font(.system(size: 21))
                
                Text(character.species)
                    .font(.system(size: 16))
            }
            .padding()
            
            Spacer()
        }
    }
}

// MARK: Preview Provider
struct CharacterCell_Previews: PreviewProvider {
    static var previews: some View {
        CharacterCell(character: Character(id: 0,
                                           name: "Name",
                                           status: "Status",
                                           species: "Species",
                                           image: "htttp://test.com/test.img"))
            
            .previewLayout(.fixed(width: 400.0,
                                  height: 100.0))
    }
}
