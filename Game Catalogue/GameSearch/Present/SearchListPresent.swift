//
//  SearchListPresent.swift
//  Game Catalogue
//
//  Created by Amin faruq on 07/07/20.
//  Copyright © 2020 Amin faruq. All rights reserved.
//

import Foundation
import Alamofire

protocol SearchListRequest : BaseRequest{
    func doGetSearchList(query : String)
}

protocol SearchListResponse : BaseResponse {
    func displayGetSearchList(result : [SearchModel])
}

extension SearchListResponse{
    func displayGetSearchList(result : [SearchModel]){}
}

struct SearchListPresent : SearchListRequest {
    
    weak var output : SearchListResponse?
    
    func doGetSearchList(query: String) {
        SearchWorker.doGetSearchList(query: query, onSuccess: { (result) in
            self.output?.displayGetSearchList(result: result)
        }) {
            self.output?.displayError(message: "Search List has problem", object: "")
        }
    }
}
