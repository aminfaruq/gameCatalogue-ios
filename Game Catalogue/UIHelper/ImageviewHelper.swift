//
//  ImageviewHelper.swift
//  Game Catalogue
//
//  Created by Amin faruq on 09/07/20.
//  Copyright © 2020 Amin faruq. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {

    func makeRounded() {
        self.layer.borderWidth = 1
        self.layer.masksToBounds = false
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.cornerRadius = self.frame.height / 2
        self.clipsToBounds = true
    }
}
