//
//  SearchWorker.swift
//  Game Catalogue
//
//  Created by Amin faruq on 07/07/20.
//  Copyright © 2020 Amin faruq. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

public struct SearchWorker{
    
    //List search
    static func doGetSearchList( query : String , onSuccess: @escaping (_ result: [SearchModel])-> Void,  onError: @escaping () -> Void){
        
        AF.request(NetworkApps.doGetSearchList(query: query)).responseJSON { (responseJSON) in
            
            let searchList : JSON = JSON(responseJSON.value ?? "")
            let response = DAOGameListBaseClass(json: searchList)
            
            var models : [SearchModel] = []
            
            if response.results != nil {
                
                for data in response.results ?? [] {
                    var model = SearchModel()
                    model = SearchModel(id: data.id, name: data.name, released: data.released, background_image: data.backgroundImage, rating: data.rating)
                    
                    models.append(model)
                }
                
                onSuccess(models)
            }else {
                onError()
            }
        }
    }
}
