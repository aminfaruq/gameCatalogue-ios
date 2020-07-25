//
//  DetailCreatorPresent.swift
//  Game Catalogue
//
//  Created by Amin faruq on 12/07/20.
//  Copyright © 2020 Amin faruq. All rights reserved.
//

import Foundation
import Alamofire

protocol DetailCreatorsRequest : BaseRequest {
    func doGetDetailCreators(creatorId : String)
    func doGetDetailCreatorPosition(creatorId : String)
    func doGetDetailCreatorPlatfroms(creatorId : String)
}

protocol DetailCreatorResponse : BaseResponse {
    func displayGetDetailCreators(result : DetailCreatorModel)
    func displayGetDetailCreatorPositions (result : [DetailCreatorPosition])
    func displayGetDetailCreatorPlatfroms(result : [DetailCreatorPlatfroms])
}

extension DetailCreatorResponse{
    func displayGetDetailCreators(result : DetailCreatorModel){}
    func displayGetDetailCreatorPositions (result : [DetailCreatorPosition]){}
    func displayGetDetailCreatorPlatfroms(result : [DetailCreatorPlatfroms]){}
}

struct DetailCreatorPresent : DetailCreatorsRequest {
    
    
    weak var output : DetailCreatorResponse?
    
    func doGetDetailCreators(creatorId: String) {
        DetailCreatorWorker.doGetCreatorDetail(creatorId: creatorId, onSuccess: { (result) in
            self.output?.displayGetDetailCreators(result: result)
        }) {
            self.output?.displayError(message: "Detail Creator was problem", object: "")
        }
    }
    
    func doGetDetailCreatorPosition(creatorId: String) {
        DetailCreatorWorker.doGetGameDetailCreatorPosition(creatorId: creatorId, onSuccess: { (result) in
            self.output?.displayGetDetailCreatorPositions(result: result)
        }) {
            self.output?.displayError(message: "Detail Creator Position was problem", object: "")
        }
    }
    
    func doGetDetailCreatorPlatfroms(creatorId: String) {
        
        DetailCreatorWorker.doGetGameDetailCreatorPlatfroms(creatorId: creatorId, onSuccess: { (result) in
            self.output?.displayGetDetailCreatorPlatfroms(result: result)
        }) {
             self.output?.displayError(message: "Detail Creator Position was problem", object: "")
        }
    }
    
    
    
}
