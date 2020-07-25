//
//  GameListWorker.swift
//  Game Catalogue
//
//  Created by Amin faruq on 07/07/20.
//  Copyright © 2020 Amin faruq. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

public struct GameListWorker{
    
    //List Horizontal
    
    static func doGetListHZ(onSuccess: @escaping (_ result: [GameListModel])-> Void,  onError: @escaping () -> Void){
        
        AF.request(NetworkApps.doGetGameList(page: "1")).responseJSON { (responseJSON) in
            
            let gameListHZ : JSON = JSON(responseJSON.value ?? "")
            
            let response = DAOGameListBaseClass(json: gameListHZ)
            
            var models : [GameListModel] = []
            
            if response.results != nil {
                
                for data in response.results ?? [] {
                    var model = GameListModel()
                    model = GameListModel(id: data.id, name: data.name, released: data.released, background_image: data.backgroundImage, rating: data.rating)
                    
                    models.append(model)
                }
                
                onSuccess(models)
                
            }else{
                
                onError()
                
            }
        }
    }
    
    //List Vertical
    static func doGetListVC(onSuccess: @escaping (_ result: [GameListModelVC])-> Void,  onError: @escaping () -> Void){
        
        AF.request(NetworkApps.doGetGameList(page: "2")).responseJSON { (responseJSON) in
            
            let gameListVC : JSON = JSON(responseJSON.value ?? "")
            
            let response = DAOGameListBaseClass(json: gameListVC)
            
            var models : [GameListModelVC] = []
            
            if response.results != nil{
                
                for data in response.results ?? [] {
                    var model = GameListModelVC()
                    model = GameListModelVC(id: data.id, name: data.name, released: data.released, background_image: data.backgroundImage, rating: data.rating)
                    
                    models.append(model)
                }
                
                onSuccess(models)
                
            }else{
                
                onError()
                
            }
        }
        
    }
    
}
