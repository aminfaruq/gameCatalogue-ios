//
//  DetailDeveloperWireframe.swift
//  Game Catalogue
//
//  Created by Amin faruq on 12/07/20.
//  Copyright © 2020 Amin faruq. All rights reserved.
//

import Foundation
import UIKit

public struct DetailDeveloperWireframe{
    
    public static func performToDetailDeveloper(developerId : Int?, caller : UIViewController){
        
        let storyboard = UIStoryboard(name: "DetailDeveloper", bundle: nil)
        
        let nav = storyboard.instantiateInitialViewController()! as! UINavigationController
        let vc = nav.topViewController as! DetailDeveloperVC
        
        vc.developerId = developerId ?? 0
        
        caller.navigationController?.pushViewController(vc, animated: true)
    }
    
}
