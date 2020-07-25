//
//  DetailCreatorWireframe.swift
//  Game Catalogue
//
//  Created by Amin faruq on 12/07/20.
//  Copyright © 2020 Amin faruq. All rights reserved.
//

import Foundation
import UIKit

public struct DetailCreatorWireframe{
    public static func performToDetailCreators(creatorId : Int? , caller : UIViewController){
           
           let storyboard = UIStoryboard(name: "DetailCreator", bundle: nil)
           let nav = storyboard.instantiateInitialViewController()! as! UINavigationController
           let vc = nav.topViewController as! DetailCreatorVC
           
           vc.creatorId = creatorId ?? 0
           caller.navigationController?.pushViewController(vc, animated: true)
           
       }
}
