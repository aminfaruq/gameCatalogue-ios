//
//  DetailGameTextVC.swift
//  Game Catalogue
//
//  Created by Amin faruq on 22/07/20.
//  Copyright © 2020 Amin faruq. All rights reserved.
//

import UIKit

class DetailGameTextVC: UIViewController {
    
    var text : String?
    @IBOutlet weak var labelText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.labelText.text = text
    }
    


}
