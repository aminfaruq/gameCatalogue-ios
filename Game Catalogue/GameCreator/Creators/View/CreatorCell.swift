//
//  CreatorCell.swift
//  Game Catalogue
//
//  Created by Amin faruq on 09/07/20.
//  Copyright © 2020 Amin faruq. All rights reserved.
//

import UIKit

class CreatorCell: UITableViewCell {
    
    @IBOutlet weak var imageCreators: UIImageView!
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelGamesCount: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.imageCreators.makeRounded()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
