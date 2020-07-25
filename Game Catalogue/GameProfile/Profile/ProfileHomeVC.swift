//
//  ProfileHomeVC.swift
//  Game Catalogue
//
//  Created by Amin faruq on 22/07/20.
//  Copyright © 2020 Amin faruq. All rights reserved.
//

import UIKit

class ProfileHomeVC: UIViewController {
    
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var editButton: RoundButton!
    @IBOutlet weak var resetButton: RoundButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.image.makeRounded()
    }
    
    
}
