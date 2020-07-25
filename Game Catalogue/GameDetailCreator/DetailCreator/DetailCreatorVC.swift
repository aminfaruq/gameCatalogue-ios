//
//  DetailCreatorVC.swift
//  Game Catalogue
//
//  Created by Amin faruq on 12/07/20.
//  Copyright © 2020 Amin faruq. All rights reserved.
//

import UIKit
import Alamofire
import SDWebImage
import RealmSwift

class DetailCreatorVC: UIViewController {
    
    @IBOutlet weak var imageBackground: UIImageView!
    @IBOutlet weak var imageBackgroundAddition: UIImageView!
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var collectionPositions: UICollectionView!
    @IBOutlet weak var labelDescription: UILabel!
    @IBOutlet weak var collectionPlatfroms: UICollectionView!
    
    private var input : DetailCreatorsRequest?
    private var detailCreator : DetailCreatorModel?
    private var creatorListPosition : [DetailCreatorPosition] = []
    private var creatorListPlatfroms : [DetailCreatorPlatfroms] = []
    private var isFavorite = false
    let realm = try! Realm()
    var creatorId : Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.navigationController?.navigationBar.tintColor = UIColor.red
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.red]
        self.registerCell()
        self.imageBackgroundAddition.makeRounded()
        self.input?.doGetDetailCreators(creatorId: "\(creatorId ?? 0)")
        self.input?.doGetDetailCreatorPosition(creatorId: "\(creatorId ?? 0)")
        self.input?.doGetDetailCreatorPlatfroms(creatorId: "\(creatorId ?? 0)")
        self.bookmarkIcon()
        self.setFavorite()
        self.favoriteState(id: creatorId ?? 0)
    }
    
    
    private func loadItems(result : DetailCreatorModel?){
        self.imageBackground.sd_imageIndicator = SDWebImageActivityIndicator.gray
        self.imageBackgroundAddition.sd_imageIndicator = SDWebImageActivityIndicator.gray
        
        self.imageBackground.sd_setImage(with: URL(string: result?.background_image ?? ""), placeholderImage: UIImage(named: "broken-image"))
        self.imageBackgroundAddition.sd_setImage(with: URL(string: result?.background_image_additional ?? ""), placeholderImage: UIImage(named: "broken-image"))
        self.labelName.text = result?.name
        self.title = result?.name
        self.labelDescription.text = result?.description
    }
    
    private func registerCell(){
        self.collectionPositions.delegate = self
        self.collectionPositions.dataSource = self
        self.collectionPositions.register(UINib.init(nibName: "DetailGenreCollectionCell", bundle: self.nibBundle), forCellWithReuseIdentifier: "DetailGenreCollectionCell")
        
        self.collectionPlatfroms.delegate = self
        self.collectionPlatfroms.dataSource = self
        self.collectionPlatfroms.register(UINib.init(nibName: "DetailGenreCollectionCell", bundle: self.nibBundle), forCellWithReuseIdentifier: "DetailGenreCollectionCell")
        
    }
    
    private func bookmarkIcon(){
        //create a new button
        let button: UIButton = UIButton(type: .custom)
        //set image for button
        button.setImage(UIImage(systemName: "bookmark"), for: .normal)
        //add function for button
        button.addTarget(self, action: #selector(saveButtonPressed), for: .touchUpInside)
        //set frame
        button.frame = CGRect(x: 0, y: 0, width: 53, height: 31)
        
        let barButton = UIBarButtonItem(customView: button)
        //assign button to navigationbar
        self.navigationItem.rightBarButtonItem = barButton
    }
    
    @objc func saveButtonPressed(){
        if(isFavorite){
            removeFavorite()
        }else{
            saveFavorite()
        }
        isFavorite = !isFavorite
        setFavorite()
    }
    
    private func saveFavorite(){
        let creator = DetailCreatorModel(id: detailCreator?.id, name: detailCreator?.name, creators_count: detailCreator?.creators_count, background_image: detailCreator?.background_image, background_image_additional: detailCreator?.background_image_additional, rating: detailCreator?.rating, description: detailCreator?.description)
        
        let container = try! Container()
        try! container.write({ (transaction) in
            transaction.add(creator)
        })
        self.setFavorite()
    }
    
    private func removeFavorite(){
        let deleteCreator = self.realm.objects(DetailCreatorObject.self).filter("id = %@" , detailCreator?.id ?? 0).first
        try! self.realm.write {
            if let obj = deleteCreator{
                realm.delete(obj)
            }
        }
        self.setFavorite()
        
    }
    
    func favoriteState(id : Int) -> DetailCreatorObject?{
        let fav = realm.objects(DetailCreatorObject.self).filter("id = %@" , id).first
        if  fav?.id != nil{
            isFavorite = true
            setFavorite()
        }
        return fav
    }
    
    
    private func setFavorite(){
        //create a new button
        let button: UIButton = UIButton(type: .custom)
        //set image for button
        
        
        if (isFavorite) {
            button.setImage(UIImage(systemName: "bookmark.fill"), for: .normal)
        }else {
            button.setImage(UIImage(systemName: "bookmark"), for: .normal)
        }
        //add function for button
        button.addTarget(self, action: #selector(saveButtonPressed), for: .touchUpInside)
        //set frame
        button.frame = CGRect(x: 0, y: 0, width: 53, height: 31)
        
        let barButton = UIBarButtonItem(customView: button)
        //assign button to navigationbar
        self.navigationItem.rightBarButtonItem = barButton
        
    }
    
    
    
    
    
}

extension DetailCreatorVC : UICollectionViewDelegate , UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == collectionPositions{
            return creatorListPosition.count
        }else {
            return creatorListPlatfroms.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == collectionPositions {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DetailGenreCollectionCell", for: indexPath) as! DetailGenreCollectionCell
            cell.labelGenre.text = creatorListPosition[indexPath.item].slug
            return cell
        }else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DetailGenreCollectionCell", for: indexPath) as! DetailGenreCollectionCell
            cell.labelGenre.text = creatorListPlatfroms[indexPath.item].slug
            return cell
        }
    }
    
    
}

extension DetailCreatorVC : DetailCreatorResponse {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.config(vc: self)
    }
    
    
    func config(vc : DetailCreatorVC){
        var request = DetailCreatorPresent()
        request.output = vc
        vc.input = request
    }
    
    func displayGetDetailCreators(result: DetailCreatorModel) {
        self.loadItems(result: result)
        self.detailCreator = result
    }
    
    func displayGetDetailCreatorPositions(result: [DetailCreatorPosition]) {
        self.creatorListPosition = result
        self.collectionPositions.reloadData()
    }
    
    func displayGetDetailCreatorPlatfroms(result: [DetailCreatorPlatfroms]) {
        self.creatorListPlatfroms = result
        self.collectionPlatfroms.reloadData()
    }
    
    func displayError(message: String, object: Any) {
        
    }
    
    func resultRequest(request: DataRequest) {
        
    }
    
    
}
