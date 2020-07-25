//
//  DetailGameWorker.swift
//  Game Catalogue
//
//  Created by Amin faruq on 11/07/20.
//  Copyright © 2020 Amin faruq. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

public struct DetailGameWorker{
    
    static func doGetGameDetail(gameId : String,onSuccess: @escaping (_ result: DetailGameModel)-> Void,  onError: @escaping () -> Void){
        
        AF.request("\(GameApps.GetUrl())games/\(gameId)").responseJSON { (responseJSON) in
            
            let detailGame : JSON = JSON(responseJSON.value ?? "")
            
            let response = DAODetailGameBaseClass(json: detailGame)
            
            if response.id != nil {
                var model = DetailGameModel()
                model = DetailGameModel(id: response.id, name: response.name, creators_count: response.creatorsCount, background_image: response.backgroundImage, background_image_additional: response.backgroundImageAdditional, released: response.released, description: response.descriptionRaw, website: response.website, rating: response.rating, clip: response.clip?.video , playtime : response.playtime)
                
                onSuccess(model)
            }else {
                onError()
            }
            
            
        }
        
    }
    
    static func doGetGameDetailGenres(gameId : String,onSuccess: @escaping (_ result: [DetailGameGenresModel])-> Void,  onError: @escaping () -> Void){
        
     
            
            AF.request("\(GameApps.GetUrl())games/\(gameId)").responseJSON { (responseJSON) in
                
                let genreList : JSON = JSON(responseJSON.value ?? "")
                let response = DAODetailGameBaseClass(json: genreList)
                
                var models : [DetailGameGenresModel] = []
                
                if response.genres != nil {
                    
                    for data in response.genres ?? []{
                        var model = DetailGameGenresModel()
                        model = DetailGameGenresModel(id: data.id, name: data.name, slug: data.slug)
                        models.append(model)
                    }
                    
                    onSuccess(models)
                    
                }else {
                    onError()
                }
            }
        
    }
    
    
    static func doGetGameDetailPlatfrom(gameId : String,onSuccess: @escaping (_ result: [DetailGamePlatforms])-> Void,  onError: @escaping () -> Void){
        
        
            AF.request("\(GameApps.GetUrl())games/\(gameId)").responseJSON { (responseJSON) in
                
                let genreList : JSON = JSON(responseJSON.value ?? "")
                let response = DAODetailGameBaseClass(json: genreList)
                
                var models : [DetailGamePlatforms] = []
                
                if response.platforms != nil {
                    
                    for data in response.platforms ?? []{
                        var model = DetailGamePlatforms()
                        model = DetailGamePlatforms( name: data.platform?.name, slug: data.platform?.slug)
                        models.append(model)
                    }
                    
                    onSuccess(models)
                    
                }else {
                    onError()
                }
            }
        
        
    }
    
    static func doGetGameDetailStores(gameId : String,onSuccess: @escaping (_ result: [DetailGameStores])-> Void,  onError: @escaping () -> Void){
        

        AF.request("\(GameApps.GetUrl())games/\(gameId)").responseJSON { (responseJSON) in
            
            let storeList : JSON = JSON(responseJSON.value ?? "")
            let response = DAODetailGameBaseClass(json: storeList)
            
            var models : [DetailGameStores] = []
            
            if response.stores != nil {
                
                for data in response.stores ?? [] {
                    var model = DetailGameStores()
                    model = DetailGameStores(id: data.id, url: data.url, name: data.store?.name, imageBackgroud: data.store?.imageBackground)
                    models.append(model)
                }
                
                onSuccess(models)
            }else {
                onError()
            }
        }
    }
}
