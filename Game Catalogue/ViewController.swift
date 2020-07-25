//
//  ViewController.swift
//  Game Catalogue
//
//  Created by Amin faruq on 06/07/20.
//  Copyright © 2020 Amin faruq. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let storyboard = UIStoryboard(name: "GameTabbar", bundle: nil)
        guard let vc = storyboard.instantiateInitialViewController() as? GameTabbar else {
            return
        }
        self.navigationController?.pushViewController(vc, animated: true)
    }


}

