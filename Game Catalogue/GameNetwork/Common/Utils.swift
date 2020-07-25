//
//  Utils.swift
//  Game Catalogue
//
//  Created by Amin faruq on 06/07/20.
//  Copyright © 2020 Amin faruq. All rights reserved.
//

import Foundation
import Alamofire

public protocol BaseRequest {
    
}

public protocol BaseResponse : class {
    func displayError(message:String,object:Any)
    func resultRequest(request: DataRequest)
}

