//
//  GameApps.swift
//  Game Catalogue
//
//  Created by Amin faruq on 06/07/20.
//  Copyright © 2020 Amin faruq. All rights reserved.
//

import Foundation


public struct GameApps{

    public static func GetConfig() -> Dictionary<String, Any>? {
        var myDict: Dictionary<String, Any>?
        if let path = Bundle.main.path(forResource: "KMConfig", ofType: "plist"), let dict = NSDictionary(contentsOfFile: path) as? [String: Any] {
            myDict = dict
        }
        
        if let url = Bundle.main.url(forResource: "KMConfig", withExtension: "plist")
        {
            let d = NSDictionary(contentsOf: url)
            debugPrint(url)
            debugPrint(d ?? "")
        } else {
            debugPrint("No url")
        }
        
        if let fileUrl = Bundle.main.url(forResource: "KMConfig", withExtension: "plist"),
            let data = try? Data(contentsOf: fileUrl) {
            if let result = try? PropertyListSerialization.propertyList(from: data, options: [], format: nil) as? [[String: Any]] { // [String: Any] which ever it is
                print(result)
            }
        }
        return myDict
    }
    
    public static func GetUrl() -> String{
        if let config = GetConfig() {
            return config["base_url"] as! String
        }
        return ""
    }
    
}

