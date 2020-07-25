//
//  DeveloperListPresent.swift
//  Game Catalogue
//
//  Created by Amin faruq on 09/07/20.
//  Copyright © 2020 Amin faruq. All rights reserved.
//

import Foundation
import Alamofire

protocol DeveloperListRequest : BaseRequest {
    func doGetDev(page : String)
 
}

protocol DeveloperListResponse : BaseResponse {
    func displayGetDevOne(result : [DeveloperListModel])
    
}

extension DeveloperListResponse{
    func displayGetDevOne(result : [DeveloperListModel]){}
   
}

struct DeveloperListPresent : DeveloperListRequest {
    
    weak var output : DeveloperListResponse?
    
    func doGetDev(page : String) {
        DeveloperListWorker.doGetListDev(page : page , onSuccess: { (result) in
            self.output?.displayGetDevOne(result: result)
        }) {
            self.output?.displayError(message: "Dev list 1 was problem", object: "")
        }
    }
    
   
    
}
