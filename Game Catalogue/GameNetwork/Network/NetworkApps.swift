//
//  NetworkApps.swift
//  Game Catalogue
//
//  Created by Amin faruq on 06/07/20.
//  Copyright © 2020 Amin faruq. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

public enum NetworkApps : URLRequestConvertible {
    
    static let baseURLString = GameApps.GetUrl()
    
    case doGetGameList(page : String?)
    case doGetSearchList(query : String?)
    case doGetCreators(page : String?)
    case doGetDeveloperList(page : String?)
    case doGetDetailGame(idGame : String?)
    
    var method : HTTPMethod{
        switch self {
        case .doGetGameList(_):
            return .get
        case .doGetSearchList(_):
            return .get
        case .doGetCreators(_):
            return .get
        case .doGetDeveloperList(_):
            return .get
        case .doGetDetailGame(_):
            return .get
        default: 
            break
        }
    }
    
    var res: (path: String, param: [String: Any]) {
        switch self {
        case .doGetGameList(let page):
            return ("games" , ["page" : page ?? ""])
        case .doGetSearchList(let query):
            return ("games" , ["search" : query ?? ""])
        case .doGetCreators(let page):
            return ("creators", ["page" : page ?? ""])
        case .doGetDeveloperList(let page):
            return ("developers" , ["page" : page ?? ""])
        case .doGetDetailGame(let idGame):
            return ("games" , ["/" : idGame ?? ""])
        default:
            break
        }
    }
    
    
    public func asURLRequest() throws -> URLRequest {
        var url: URL?
        var urlRequest: URLRequest?
        url = try NetworkApps.baseURLString.asURL()
        urlRequest = URLRequest(url: (url?.appendingPathComponent(res.path))!)
        urlRequest?.httpMethod = method.rawValue
        
        urlRequest = try URLEncoding.default.encode(urlRequest!, with: res.param)
        print("URL API => "+(urlRequest?.url?.absoluteString)!)
        print("Parameter => \(res.param)")
        return urlRequest!
    }
    
    
}
