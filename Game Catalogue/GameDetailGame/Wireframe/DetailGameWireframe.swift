//
//  DetailGameWireframe.swift
//  Game Catalogue
//
//  Created by Amin faruq on 11/07/20.
//  Copyright © 2020 Amin faruq. All rights reserved.
//

import Foundation
import UIKit

public struct DetailGameWireframe{
    public static func performToDetailGame(gameId : Int? , caller : UIViewController){
        
        let storyboard = UIStoryboard(name: "DetailGame", bundle: nil)
        let nav = storyboard.instantiateInitialViewController()! as! UINavigationController
        let vc = nav.topViewController as! DetailGameVC
        
        vc.idGame = gameId ?? 0
        caller.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    public static func performToDetailWebview(url : String? , caller : UIViewController){
        
        let storyboard = UIStoryboard(name: "DetailGameWebview", bundle: nil)
        let nav = storyboard.instantiateInitialViewController()! as! UINavigationController
        let vc = nav.topViewController as! DetailGameWebviewVC
        
        vc.urlWeb = url ?? ""
        caller.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    
    public static func performToDetailTextview(text : String? , caller : UIViewController){
        
        let storyboard = UIStoryboard(name: "DetailGameText", bundle: nil)
        let nav = storyboard.instantiateInitialViewController()! as! UINavigationController
        let vc = nav.topViewController as! DetailGameTextVC
        
        vc.text = text ?? ""
        
        let transition:CATransition = CATransition()
        transition.duration = 0.5
        transition.timingFunction = CAMediaTimingFunction(name:CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromTop
        caller.navigationController?.view.layer.add(transition, forKey: kCATransition)
        caller.navigationController?.pushViewController(vc, animated: true)
        
    }
}
