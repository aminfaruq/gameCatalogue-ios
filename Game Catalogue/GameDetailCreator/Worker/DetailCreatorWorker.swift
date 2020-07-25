//
//  DetailCreatorworker.swift
//  Game Catalogue
//
//  Created by Amin faruq on 12/07/20.
//  Copyright © 2020 Amin faruq. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

public struct DetailCreatorWorker {
    
    static func doGetCreatorDetail(creatorId : String , onSuccess: @escaping (_ result: DetailCreatorModel)-> Void,  onError: @escaping () -> Void){
        
        AF.request("\(GameApps.GetUrl())creators/\(creatorId)").responseJSON { (responseJSON) in
            
            
            let detailCreator : JSON = JSON(responseJSON.value ?? "")
            let response = DAODetailCreatorBaseClass(json: detailCreator)
            
            if response.id != nil {
                var model = DetailCreatorModel()
                model = DetailCreatorModel(id: response.id, name: response.name, creators_count: response.gamesCount, background_image: response.imageBackground, background_image_additional:response.image , rating: response.rating, description: response.descriptionValue)
                
                onSuccess(model)
            }else {
                onError()
            }
        }
    }
    
    static func doGetGameDetailCreatorPosition(creatorId : String,onSuccess: @escaping (_ result: [DetailCreatorPosition])-> Void,  onError: @escaping () -> Void){
        
        AF.request("\(GameApps.GetUrl())creators/\(creatorId)").responseJSON { (responseJSON) in
        
            let creatorPosition : JSON = JSON(responseJSON.value ?? "")
            let response = DAODetailCreatorBaseClass(json: creatorPosition)
            
            var models : [DetailCreatorPosition] = []
            
            if response.positions != nil {
                
                for data in response.positions ?? [] {
                    var model = DetailCreatorPosition()
                    model = DetailCreatorPosition(id: data.id, name: data.name, slug: data.slug)
                    models.append(model)
                }
                
                onSuccess(models)
            }else{
                onError()
            }
            
        }
    }
    
    static func doGetGameDetailCreatorPlatfroms(creatorId : String,onSuccess: @escaping (_ result: [DetailCreatorPlatfroms])-> Void,  onError: @escaping () -> Void){
        
        AF.request("\(GameApps.GetUrl())creators/\(creatorId)").responseJSON { (responseJSON) in
        
            let creatorPosition : JSON = JSON(responseJSON.value ?? "")
            let response = DAODetailCreatorBaseClass(json: creatorPosition)
            
            var models : [DetailCreatorPlatfroms] = []
            
            if response.positions != nil {
                
                for data in response.platforms?.results ?? [] {
                    var model = DetailCreatorPlatfroms()
                
                    model = DetailCreatorPlatfroms(id: data.platform?.id, name: data.platform?.name, slug: data.platform?.slug)
                    models.append(model)
                }
                
                onSuccess(models)
            }else{
                onError()
            }
            
        }
    }
}
