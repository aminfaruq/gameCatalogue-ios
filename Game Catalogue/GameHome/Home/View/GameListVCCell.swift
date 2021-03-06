//
//  GameListVCCell.swift
//  Game Catalogue
//
//  Created by Amin faruq on 07/07/20.
//  Copyright © 2020 Amin faruq. All rights reserved.
//

import UIKit

class GameListVCCell: UICollectionViewCell {
    
    @IBOutlet weak var imageListVC: UIImageView!
    
    @IBOutlet weak var labelName: UILabel!
    
    @IBOutlet weak var labelDate: UILabel!
    
    @IBOutlet weak var labelRating: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.imageListVC.clipsToBounds = true
        self.imageListVC.layer.cornerRadius = 5
    }
}
