//
//  DetailDeveloperPresent.swift
//  Game Catalogue
//
//  Created by Amin faruq on 12/07/20.
//  Copyright © 2020 Amin faruq. All rights reserved.
//

import Foundation
import Alamofire

protocol DetailDeveloperRequest : BaseRequest {
    func doGetDetailDeveloper(developerId : String)
}

protocol DetailDeveloperResponse : BaseResponse {
    func displayGetDetailDeveloper(result : DetailDeveloperModel)
}

extension DetailDeveloperResponse {
    func displayGetDetailDeveloper(result : DetailDeveloperModel){}
}

struct DetailDeveloperPresent : DetailDeveloperRequest{
    
    weak var output : DetailDeveloperResponse?
    
    func doGetDetailDeveloper(developerId: String) {
        DetailDeveloperWorker.doGetDetailDeveloper(developerId: developerId, onSuccess: { (result) in
            self.output?.displayGetDetailDeveloper(result: result)
        }) {
            self.output?.displayError(message: "Detail developer was problem", object: "")
        }
    }
    
    
}
