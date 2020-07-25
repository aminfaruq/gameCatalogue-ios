//
//  FavoriteVC.swift
//  Game Catalogue
//
//  Created by Amin faruq on 21/07/20.
//  Copyright © 2020 Amin faruq. All rights reserved.
//

import UIKit
import MXSegmentedPager

class FavoriteVC: MXSegmentedPagerController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        // Do any additional setup after loading the view.
        segmentedPager.backgroundColor = .white
        segmentedPager.parallaxHeader.height = 15
        segmentedPager.parallaxHeader.mode = .fill
        segmentedPager.parallaxHeader.minimumHeight = 20
        
        // Segmented Control customization
        segmentedPager.segmentedControl.indicator.linePosition = .bottom
        segmentedPager.segmentedControl.textColor = .black
        segmentedPager.segmentedControl.selectedTextColor = .orange
        segmentedPager.segmentedControl.indicator.lineView.backgroundColor = .orange
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewSafeAreaInsetsDidChange() {
        segmentedPager.parallaxHeader.minimumHeight = 20
    }
    
    override func segmentedPager(_ segmentedPager: MXSegmentedPager, titleForSectionAt index: Int) -> String {
        return ["Games", "Developers", "Creators"][index]
    }
    
    override func segmentedPager(_ segmentedPager: MXSegmentedPager, didScrollWith parallaxHeader: MXParallaxHeader) {
        print("progress \(parallaxHeader.progress)")
    }
    
}
