//
//  GameListPresent.swift
//  Game Catalogue
//
//  Created by Amin faruq on 07/07/20.
//  Copyright © 2020 Amin faruq. All rights reserved.
//

import Foundation
import Alamofire

protocol GameListRequest : BaseRequest {
    func doGetListHz()
    func doGetListVc()
}

protocol GameListResponse : BaseResponse {
    func displayGetListHZ(result : [GameListModel])
    func displayGetListVC(result : [GameListModelVC])
}

extension GameListResponse{
    func displayGetListHZ(result : [GameListModel]){}
    func displayGetListVC(result : [GameListModelVC]){}
}

struct GameListPresent : GameListRequest {
    
    weak var output : GameListResponse?
    
    func doGetListHz() {
        GameListWorker.doGetListHZ(onSuccess: { (result) in
            self.output?.displayGetListHZ(result: result)
        }) {
            self.output?.displayError(message: "List HZ has problem", object: "")
        }
    }
    
    func doGetListVc() {
           GameListWorker.doGetListVC(onSuccess: { (result) in
               self.output?.displayGetListVC(result: result)
           }) {
               self.output?.displayError(message: "List VC has problem", object: "")
           }
       }
}
