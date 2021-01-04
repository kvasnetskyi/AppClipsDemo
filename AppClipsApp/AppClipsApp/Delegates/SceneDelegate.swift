//
//  SceneDelegate.swift
//  AppClipsApp
//
//  Created by Артём Кваснецкий on 16.11.2020.
//

import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    // MARK: - Public Properties
    var window: UIWindow?
    
    // MARK: - Private Properties
    private let parser: UserActivityParserInput = {
        return UserActivityParser()
    }()
    
    // MARK: - Scene Methods
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {
        
        let id = parser.getCharacterID(from: connectionOptions)
        let contentView = getContentView(with: id)
        
        // Use a UIHostingController as window root view controller.
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            window.rootViewController = UIHostingController(rootView: contentView)
            self.window = window
            window.makeKeyAndVisible()
        }
    }
}

// MARK: - Fileprivate Methods
extension SceneDelegate {
    fileprivate func getContentView(with id: Int?) -> some View {
        return Group {
            if let id = id {
                VDetails(with: id)
            } else {
                VInitial()
            }
        }
    }
}
