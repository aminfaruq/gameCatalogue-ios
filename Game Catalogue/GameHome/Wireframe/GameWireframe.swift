//
//  GameWireframe.swift
//  Game Catalogue
//
//  Created by Amin faruq on 06/07/20.
//  Copyright © 2020 Amin faruq. All rights reserved.
//

import Foundation
import UIKit

public struct GameWireframe{
    public static func performToGameHome(caller: UIViewController) -> UIViewController {
        let storyboard = UIStoryboard(name: "Game", bundle: nil)
        let vc = storyboard.instantiateInitialViewController()! as! GameVC
        vc.navigationController?.isNavigationBarHidden = true
        return vc
    }
}
