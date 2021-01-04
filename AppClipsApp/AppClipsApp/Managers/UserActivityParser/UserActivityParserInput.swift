//
//  UserActivityParserInput.swift
//  AppClipsApp
//
//  Created by Артём Кваснецкий on 20.11.2020.
//

import UIKit.UIScene

protocol UserActivityParserInput {
    func getCharacterID(from options: UIScene.ConnectionOptions) -> Int?
}
