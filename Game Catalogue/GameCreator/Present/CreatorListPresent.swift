//
//  CreatorListPresent.swift
//  Game Catalogue
//
//  Created by Amin faruq on 08/07/20.
//  Copyright © 2020 Amin faruq. All rights reserved.
//

import Foundation
import Alamofire

protocol CreatorsListRequest : BaseRequest {
    func doGetCreatorList(page : String)
}

protocol CreatorListResponse : BaseResponse {
    func displayGetCreator(result : [CreatorListModel])
}

extension CreatorListResponse{
    
    func displayGetCreator(result : [CreatorListModel]){}
}

struct CreatorListPresent : CreatorsListRequest {
    
    weak var output : CreatorListResponse?
    
    func doGetCreatorList(page : String) {
        CreatorListWorker.doGetListCreator(page: page, onSuccess: { (result) in
            self.output?.displayGetCreator(result: result)
        }) {
            self.output?.displayError(message: "Creator list was problem", object: "")
        }
    }
    
    
}
