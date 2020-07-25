//
//  DetailGamePresent.swift
//  Game Catalogue
//
//  Created by Amin faruq on 11/07/20.
//  Copyright © 2020 Amin faruq. All rights reserved.
//

import Foundation
import Alamofire

protocol DetailGameRequest : BaseRequest {
    func doGetDetailGame(gameId : String)
    func doGetDetailGameGenres(gameId : String)
    func doGetDetailPlatfroms(gameId : String)
    func doGetDetailStores(gameId : String)
}

protocol DetailGameResponse : BaseResponse {
    func displayGetDetailGame(result : DetailGameModel)
    func displayGetDetailGameGenre(result : [DetailGameGenresModel])
    func displayGetDetailGamePlatfrom(result : [DetailGamePlatforms])
    func displayGetDetailGameStores(result : [DetailGameStores])
}

extension DetailGameResponse{
    func displayGetDetailGame(result : DetailGameModel){}
    func displayGetDetailGameGenre(result : [DetailGameGenresModel]){}
    func displayGetDetailGamePlatfrom(result : [DetailGamePlatforms]){}
    func displayGetDetailGameStores(result : [DetailGameStores]){}
}

struct DetailGamePresent : DetailGameRequest {
    
    
    weak var output : DetailGameResponse?
    
    func doGetDetailGame(gameId: String) {
        DetailGameWorker.doGetGameDetail(gameId: gameId, onSuccess: { (result) in
            self.output?.displayGetDetailGame(result: result)
        }) {
            self.output?.displayError(message: "DetailGame was problem", object: "")
        }
    }
    
    func doGetDetailGameGenres(gameId: String) {
        DetailGameWorker.doGetGameDetailGenres(gameId: gameId, onSuccess: { (result) in
            self.output?.displayGetDetailGameGenre(result: result)
        }) {
            self.output?.displayError(message: "Detail genre was problem", object: "")
        }
    }
    
    func doGetDetailPlatfroms(gameId: String) {
        DetailGameWorker.doGetGameDetailPlatfrom(gameId: gameId, onSuccess: { (result) in
            self.output?.displayGetDetailGamePlatfrom(result: result)
        }) {
            self.output?.displayError(message: "Detail platfrom was problem", object: "")
            
        }
    }
    
    func doGetDetailStores(gameId: String) {
        DetailGameWorker.doGetGameDetailStores(gameId: gameId, onSuccess: { (result) in
            self.output?.displayGetDetailGameStores(result: result)
        }) {
            self.output?.displayError(message: "Detail Stores was problem", object: "")
        }
    }
    
    
}
