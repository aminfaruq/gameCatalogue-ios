//
//  GameListHZCell.swift
//  Game Catalogue
//
//  Created by Amin faruq on 07/07/20.
//  Copyright © 2020 Amin faruq. All rights reserved.
//

import UIKit

class GameListHZCell: UICollectionViewCell {
    
    @IBOutlet weak var imageGame: UIImageView!
    
    @IBOutlet weak var labelName: UILabel!
    
    @IBOutlet weak var labelDate: UILabel!

    @IBOutlet weak var labelRating: UILabel!
}

extension GameListHZCell{
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layoutIfNeeded()
        self.imageGame.clipsToBounds = true
        self.imageGame.layer.cornerRadius = 10
    }
}
