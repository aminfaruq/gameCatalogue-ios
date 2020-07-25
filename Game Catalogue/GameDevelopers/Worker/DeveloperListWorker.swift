//
//  DeveloperListWorker.swift
//  Game Catalogue
//
//  Created by Amin faruq on 09/07/20.
//  Copyright © 2020 Amin faruq. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

public struct DeveloperListWorker{
    
    static func doGetListDev(page : String,onSuccess: @escaping (_ result: [DeveloperListModel])-> Void,  onError: @escaping () -> Void){
        
        AF.request(NetworkApps.doGetDeveloperList(page: page)).responseJSON { (responseJSON) in
            
            let developerList : JSON = JSON(responseJSON.value ?? "")
            
            let response = DAODeveloperListBaseClass(json: developerList)
            
            var models : [DeveloperListModel] = []
            
            
            if response.results != nil {
                for data in response.results ?? []{
                    var model = DeveloperListModel()
                    model = DeveloperListModel(id: data.id, name: data.name, background_image: data.imageBackground,
                                               games_count: data.gamesCount)
                    
                    
                    models.append(model)
                }
                
                onSuccess(models)
                
            }else {
                
                onError()
            }
        }
    }
    
    
}
