//
//  GameTabbar.swift
//  Game Catalogue
//
//  Created by Amin faruq on 06/07/20.
//  Copyright © 2020 Amin faruq. All rights reserved.
//

import UIKit

class GameTabbar: UITabBarController , UITabBarControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        
        //home
        let home = GameWireframe.performToGameHome(caller: self)
        home.tabBarItem = UITabBarItem(title: "Home", image: UIImage(named: "home"), selectedImage: UIImage(named: "home-click"))
        
        
        //developer
        let developer = DeveloperListWireframe.performToDeveloperList(caller: self)
        developer.tabBarItem = UITabBarItem(title: "developer", image: UIImage(named: "developer"), selectedImage: UIImage(named: "developer-click"))
        
        //creator
        let creator = CreatorsListWireframe.performToCreatorsList(caller: self)
        creator.tabBarItem = UITabBarItem(title: "creator", image: UIImage(named: "creator"), selectedImage: UIImage(named: "creator-click"))
        
        //saved
        let favorite = FavoriteWireframe.performToFavorite(caller: self)
        favorite.tabBarItem = UITabBarItem(title: "favorite", image: UIImage(named: "bookmark"), selectedImage: UIImage(named: "bookmark-click"))
        
       // profile
        let profileHome = ProfileWireframe.performToProfileHome(caller: self)
        profileHome.tabBarItem = UITabBarItem(title: "profile", image: UIImage(named: "profile"), selectedImage: UIImage(named: "profile-click"))
        
        let vcS : [UIViewController] = [home, developer, creator, favorite ,profileHome]
        setViewControllers(vcS, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.hidesBackButton = true
    }
    
    
    
}
