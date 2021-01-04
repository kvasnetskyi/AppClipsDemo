//
//  VDetails.swift
//  AppClipsApp
//
//  Created by Артём Кваснецкий on 17.11.2020.
//

import SwiftUI
import StoreKit

struct VDetails: View {
    // MARK: - ObservedObject
    @ObservedObject private var viewModel = VMDetails()
    
    // MARK: - Init
    init(with character: Character) {
        viewModel.character = character
    }
    
    init(with id: Int) {
        viewModel.characterID = id
        viewModel.setCharacter()
    }
    
    // MARK: - Body
    var body: some View {
        VStack {
            if let character = viewModel.character {
                AsyncImage(url: character.image,
                           placeholder: Image(uiImage: #imageLiteral(resourceName: "Placeholder"))
                            .resizable())
                    
                    .frame(width: 300,
                           height: 300,
                           alignment: .center)
                    .clipShape(Circle())
                    .padding()
                
                HStack {
                    Text(character.name)
                        .font(.system(size: 21))
                        .fontWeight(.bold)
                        .padding([.bottom, .top], 15)
                    
                    Spacer()
                    
                    VStack(spacing: 10) {
                        Text(character.species)
                            .font(.system(size: 17))
                            .fontWeight(.bold)
                        
                        Text(character.status)
                            .font(.system(size: 17))
                    }
                }
                .padding()
                
                
            } else {
                ProgressView()
            }
        }
        .onAppear(perform: {
            if !viewModel.isHistorySaved {
                viewModel.saveHistory()
            }
        })
        .appStoreOverlay(isPresented: $viewModel.isOverlayShown) { () -> SKOverlay.Configuration in
            return SKOverlay.AppClipConfiguration(position: .bottom)
        }
    }
}

// MARK: - Preview Provider
struct VDetails_Previews: PreviewProvider {
    static var previews: some View {
        VDetails(with: Character(id: 0,
                                 name: "Name",
                                 status: "Status",
                                 species: "Spacies",
                                 image: "htttp://test.com/img.jpg"))
    }
}
