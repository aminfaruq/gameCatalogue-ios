//
//  CreatorListWorker.swift
//  Game Catalogue
//
//  Created by Amin faruq on 08/07/20.
//  Copyright © 2020 Amin faruq. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

public struct CreatorListWorker{
    
    
    static func doGetListCreator( page : String,onSuccess: @escaping (_ result: [CreatorListModel])-> Void,  onError: @escaping () -> Void){
        
        AF.request(NetworkApps.doGetCreators(page: page)).responseJSON { (responseJSON) in
            
            
            let creatorList : JSON = JSON(responseJSON.value ?? "")
            
            let response = DAOCreatorListBaseClass(json: creatorList)
            
            var models : [CreatorListModel] = []
            
            if response.results != nil {
                
                for data in response.results ?? [] {
                    var model = CreatorListModel()
                    model = CreatorListModel(id: data.id, name: data.name, games_count: data.gamesCount, background_image: data.image)
                    
                    models.append(model)
                }
                
                onSuccess(models)
                
            }else {
                
                onError()
            }
        }
    }
}
