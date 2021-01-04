//
//  SceneDelegate.swift
//  AppClip
//
//  Created by Артём Кваснецкий on 20.11.2020.
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
        
        guard let id = parser.getCharacterID(from: connectionOptions) else { fatalError() }
        let contentView = VDetails(with: id)
        
        // Use a UIHostingController as window root view controller.
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            window.rootViewController = UIHostingController(rootView: contentView)
            self.window = window
            window.makeKeyAndVisible()
        }
    }
}
