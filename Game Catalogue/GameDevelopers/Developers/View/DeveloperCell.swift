//
//  DeveloperCell.swift
//  Game Catalogue
//
//  Created by Amin faruq on 09/07/20.
//  Copyright © 2020 Amin faruq. All rights reserved.
//

import UIKit

class DeveloperCell: UITableViewCell {
    
    @IBOutlet weak var imageDev: UIImageView!
    @IBOutlet weak var viewLabel: UIView!
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelGameCount: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.layoutIfNeeded()
        self.imageDev.clipsToBounds = true
        self.imageDev.layer.cornerRadius = 10
        self.viewLabel.layer.cornerRadius = 8
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
    }
    
}
