//
//  ProfileWireframe.swift
//  Game Catalogue
//
//  Created by Amin faruq on 12/07/20.
//  Copyright © 2020 Amin faruq. All rights reserved.
//

import Foundation
import UIKit

public struct ProfileWireframe {
   
    
    public static func performToProfileHome(caller : UIViewController) -> UIViewController {
        let storyboard = UIStoryboard(name: "ProfileHome", bundle: nil)
        let vc = storyboard.instantiateInitialViewController()! as! ProfileHomeVC
        vc.navigationController?.isNavigationBarHidden = true
        
        return vc
    }
    
   
}
