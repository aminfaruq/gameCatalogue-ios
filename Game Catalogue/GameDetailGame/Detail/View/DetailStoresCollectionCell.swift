//
//  DetailStoresCollectionCell.swift
//  Game Catalogue
//
//  Created by Amin faruq on 11/07/20.
//  Copyright © 2020 Amin faruq. All rights reserved.
//

import UIKit

class DetailStoresCollectionCell: UICollectionViewCell {
    
    @IBOutlet weak var imageStore: UIImageView!
    @IBOutlet weak var labelStore: UILabel!
    @IBOutlet weak var btnWebStore: UIButton!
    var storeItem : DetailGameStores?
    var delegate : DetailStoresCellDelegate?
    var index : IndexPath?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.contentView.layer.cornerRadius = 8
        self.imageStore.layer.cornerRadius = 8
        self.btnWebStore.layer.cornerRadius = 4
    }
    
    @IBAction func buttonToStore(_ sender: UIButton) {
        delegate?.didTapToWebview(index: index?.row)
    }
    
}

protocol DetailStoresCellDelegate {
    func didTapToWebview(index : Int?)
}

