//
//  DeveloperTableViewCell3.swift
//  Game Catalogue
//
//  Created by Amin faruq on 09/07/20.
//  Copyright © 2020 Amin faruq. All rights reserved.
//

import UIKit

class DeveloperTableViewCell3: UITableViewCell {
    
    
    @IBOutlet weak var developerCollectionThree: UICollectionView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
          self.developerCollectionThree.register(UINib.init(nibName: "DevelopersCollectionCell", bundle: nil), forCellWithReuseIdentifier: "DevelopersCollectionCell")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
