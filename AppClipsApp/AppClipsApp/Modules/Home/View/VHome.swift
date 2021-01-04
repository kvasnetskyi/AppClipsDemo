//
//  VHome.swift
//  AppClipsApp
//
//  Created by Артём Кваснецкий on 20.11.2020.
//

import SwiftUI

struct VHome: View {
    // MARK: - Private Properties
    private var data: CharactersResponse?
    
    // MARK: - Init
    init(with data: CharactersResponse?) {
        self.data = data
    }
    
    // MARK: - Body
    var body: some View {
        TabView {
            VCharacters(with: data)
                .tabItem {
                    Image(systemName: "person.3.fill")
                    Text("Characters")
                }
            
            VHistory()
                .tabItem {
                    Image(systemName: "clock.fill")
                    Text("History")
                }
        }
        .navigationBarBackButtonHidden(true)
        .navigationTitle("Characters")
    }
}
