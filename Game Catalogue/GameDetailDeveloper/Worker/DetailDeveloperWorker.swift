//
//  DetailDeveloperWorker.swift
//  Game Catalogue
//
//  Created by Amin faruq on 12/07/20.
//  Copyright © 2020 Amin faruq. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

public struct DetailDeveloperWorker{
    
    static func doGetDetailDeveloper(developerId : String , onSuccess: @escaping (_ result: DetailDeveloperModel)-> Void,  onError: @escaping () -> Void){
        
        AF.request("\(GameApps.GetUrl())developers/\(developerId)").responseJSON { (responseJSON) in
            
            
            let detailDeveloper : JSON = JSON(responseJSON.value ?? "")
            let response = DAODetailDeveloperBaseClass(json: detailDeveloper)
            
            if response.id != nil {
                var model = DetailDeveloperModel()
                model = DetailDeveloperModel(id: response.id, name: response.name, slug: response.slug, games_count: response.gamesCount, image_background: response.imageBackground, description: response.descriptionValue)
                
                onSuccess(model)
            }else {
                onError()
            }
        }
    }
}
