//
//  SearchWireframe.swift
//  Game Catalogue
//
//  Created by Amin faruq on 07/07/20.
//  Copyright © 2020 Amin faruq. All rights reserved.
//

import Foundation
import UIKit

public struct SearchWireframe {
    public static func performToSearch(caller : UIViewController){
        
        let storyboard = UIStoryboard(name: "Search", bundle: nil)
        
        let nav = storyboard.instantiateInitialViewController()! as! UINavigationController
        let vc = nav.topViewController as! SearchVC
        let transition:CATransition = CATransition()
        transition.duration = 0.5
        transition.timingFunction = CAMediaTimingFunction(name:CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromTop
        caller.navigationController?.view.layer.add(transition, forKey: kCATransition)
        caller.navigationController?.pushViewController(vc, animated: true)
    }
}
