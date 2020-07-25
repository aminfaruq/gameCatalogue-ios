//
//  GameVC.swift
//  Game Catalogue
//
//  Created by Amin faruq on 06/07/20.
//  Copyright © 2020 Amin faruq. All rights reserved.
//

import Foundation
import UIKit
import SDWebImage
import Alamofire

class GameVC: UIViewController {
    
    @IBOutlet weak var gameListHZ: UICollectionView!
    @IBOutlet weak var gameListVC: UICollectionView!
    @IBOutlet weak var heightListVC: NSLayoutConstraint!
    private var input : GameListRequest?
    private var gameListModel : [GameListModel] = []
    private var gameListModelVC : [GameListModelVC] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerCell()
        self.networkService()
    }
    
    private func registerCell(){
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        self.gameListHZ.delegate = self
        self.gameListHZ.dataSource = self
        self.gameListHZ.register(UINib.init(nibName: "GameListHZCell", bundle: self.nibBundle), forCellWithReuseIdentifier: "GameListHZCell")
        
        self.gameListVC.delegate = self
        self.gameListVC.dataSource = self
        self.gameListVC.register(UINib.init(nibName: "GameListVCCell", bundle: self.nibBundle), forCellWithReuseIdentifier: "GameListVCCell")
        
    }
    
    private func  loadingProgress() {
        let alert = UIAlertController(title: nil, message: "Please wait...", preferredStyle: .alert)
        
        let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.style = UIActivityIndicatorView.Style.medium
        loadingIndicator.startAnimating();
        alert.view.addSubview(loadingIndicator)
        present(alert, animated: true, completion: nil)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    private func networkService(){
        self.loadingProgress()
        self.input?.doGetListHz()
        self.input?.doGetListVc()
    }
    
    
    @IBAction func btnSearch(_ sender: UIButton) {
        
        SearchWireframe.performToSearch(caller: self)
    }
    
    
    
}

//MARK: - Collectionview
extension GameVC : UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == gameListHZ{
            dismiss(animated: false, completion: nil)
            return gameListModel.count
        }else{
            return gameListModelVC.count
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == gameListHZ {
            let collection = collectionView.dequeueReusableCell(withReuseIdentifier: "GameListHZCell", for: indexPath) as! GameListHZCell
            collection.imageGame.sd_imageIndicator = SDWebImageActivityIndicator.gray
            collection.imageGame.sd_setImage(with: URL(string: gameListModel[indexPath.item].background_image ?? ""), placeholderImage: UIImage(named: "broken-image"))
            collection.labelName.text = self.gameListModel[indexPath.item].name
            collection.labelDate.text = self.gameListModel[indexPath.item].released
            collection.labelRating.text = "\(self.gameListModel[indexPath.item].rating ?? 0.00)"
            
            return collection
        }else {
            
            let collection = collectionView.dequeueReusableCell(withReuseIdentifier: "GameListVCCell", for: indexPath) as! GameListVCCell
            collection.imageListVC.sd_imageIndicator = SDWebImageActivityIndicator.gray
            collection.imageListVC.sd_setImage(with: URL(string: gameListModelVC[indexPath.item].background_image ?? ""), placeholderImage: UIImage(named: "broken-image"))
            collection.labelName.text = self.gameListModelVC[indexPath.item].name
            collection.labelDate.text = self.gameListModelVC[indexPath.item].released
            collection.labelRating.text = "\(self.gameListModelVC[indexPath.item].rating ?? 0.00)"
            
            heightListVC.constant = self.gameListVC.contentSize.height
            return collection
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        
        if collectionView == gameListHZ{
            return CGSize(width: 308, height: 307)
        }else{
            return CGSize(width: 151, height: 204)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        if collectionView == gameListHZ{
            return 12
        }else{
            return 5
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == gameListHZ{
            DetailGameWireframe.performToDetailGame(gameId: gameListModel[indexPath.item].id, caller: self)
            gameListHZ.deselectItem(at: indexPath, animated: true)
        }else{
            DetailGameWireframe.performToDetailGame(gameId: gameListModelVC[indexPath.item].id, caller: self)
            gameListVC.deselectItem(at: indexPath, animated: true)
        }
    }
    
    
}

//MARK:- NETWORK SERVICE

extension GameVC : GameListResponse {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.config(vc: self)
    }
    
    
    func config(vc : GameVC){
        var request = GameListPresent()
        request.output = vc
        vc.input = request
    }
    
    func displayGetListHZ(result: [GameListModel]) {
        self.gameListModel = result
        self.gameListHZ.reloadData()
    }
    
    func displayGetListVC(result: [GameListModelVC]) {
        self.gameListModelVC = result
        self.gameListVC.reloadData()
        
    }
    
    func displayError(message: String, object: Any) {
        print(message)
    }
    
    func resultRequest(request: DataRequest) {}
    
}
