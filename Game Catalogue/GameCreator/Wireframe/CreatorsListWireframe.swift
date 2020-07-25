//
//  CreatorsListWireframe.swift
//  Game Catalogue
//
//  Created by Amin faruq on 08/07/20.
//  Copyright © 2020 Amin faruq. All rights reserved.
//

import Foundation
import UIKit

public struct CreatorsListWireframe{
    public static func performToCreatorsList(caller: UIViewController) -> UIViewController {
        let storyboard = UIStoryboard(name: "Creator", bundle: nil)
        let vc = storyboard.instantiateInitialViewController()! as! CreatorVC
        vc.navigationController?.isNavigationBarHidden = true
        return vc
    }
}
