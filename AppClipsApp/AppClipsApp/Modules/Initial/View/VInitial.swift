//
//  VInitial.swift
//  AppClipsApp
//
//  Created by Артём Кваснецкий on 16.11.2020.
//

import SwiftUI

struct VInitial: View {
    // MARK: - Private Properties
    @ObservedObject private var viewModel = VMInitial()
    
    // MARK: - Body
    var body: some View {
        NavigationView {
            ZStack {
                Image(uiImage: #imageLiteral(resourceName: "Logo"))
                    .resizable()
                    .frame(width: 200,
                           height: 200,
                           alignment: .center)
                
                /// - Tag: Navigation
                NavigationLink(
                    destination: VHome(with: viewModel.loadingResult),
                    isActive: $viewModel.dataDidLoaded,
                    label: {
                        EmptyView()
                    })
            }
        }
        .onAppear(perform: {
            viewModel.getInitialData()
        })
    }
}

// MARK: - Preview Provider
struct VInitial_Previews: PreviewProvider {
    static var previews: some View {
        VInitial()
    }
}
