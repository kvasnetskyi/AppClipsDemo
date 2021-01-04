//
//  UserActivityParser.swift
//  AppClipsApp
//
//  Created by Артём Кваснецкий on 20.11.2020.
//

import UIKit.UIScene

class UserActivityParser: UserActivityParserInput {
    // MARK: Get Character ID
    func getCharacterID(from options: UIScene.ConnectionOptions) -> Int? {
        /// https://rickandmortyapi.com/api/character/2
        
        guard let userActivity = options.userActivities.first,
              userActivity.activityType == NSUserActivityTypeBrowsingWeb,
              let incomingURL = userActivity.webpageURL,
              let components = NSURLComponents(
                url: incomingURL,
                resolvingAgainstBaseURL: true),
              let path = components.path else { return nil }
        
        let pathItems = path.components(separatedBy: "/")
        let optionalStringID = pathItems.last { (pathItem) -> Bool in
            return Int(pathItem) != nil
        }
        
        guard let stringID = optionalStringID,
              let id = Int(stringID) else { return nil }
        
        return id
    }
}
