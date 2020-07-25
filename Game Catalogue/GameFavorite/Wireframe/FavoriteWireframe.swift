//
//  FavoriteWireframe.swift
//  Game Catalogue
//
//  Created by Amin faruq on 22/07/20.
//  Copyright © 2020 Amin faruq. All rights reserved.
//

import Foundation
import UIKit

public struct FavoriteWireframe{
    public static func performToFavorite(caller: UIViewController) -> UIViewController {
        let storyboard = UIStoryboard(name: "Favorite", bundle: nil)
        let vc = storyboard.instantiateInitialViewController()! as! FavoriteVC
        vc.navigationController?.isNavigationBarHidden = true
        return vc
    }
}
