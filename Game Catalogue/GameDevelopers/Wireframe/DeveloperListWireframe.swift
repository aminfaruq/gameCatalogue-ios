//
//  CreatorListWireframe.swift
//  Game Catalogue
//
//  Created by Amin faruq on 08/07/20.
//  Copyright © 2020 Amin faruq. All rights reserved.
//

import Foundation
import UIKit

public struct DeveloperListWireframe{
    public static func performToDeveloperList(caller: UIViewController) -> UIViewController {
        let storyboard = UIStoryboard(name: "Developer", bundle: nil)
        let vc = storyboard.instantiateInitialViewController()! as! DeveloperVC
        vc.navigationController?.isNavigationBarHidden = true
        return vc
    }
}
