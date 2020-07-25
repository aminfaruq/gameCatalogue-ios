//
//  DetailGameVC.swift
//  Game Catalogue
//
//  Created by Amin faruq on 11/07/20.
//  Copyright © 2020 Amin faruq. All rights reserved.
//

import UIKit
import Alamofire
import SDWebImage
import YouTubePlayer
import RealmSwift

class DetailGameVC: UIViewController {
    
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var backgroudImageAdditional: UIImageView!
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelDate: UILabel!
    @IBOutlet weak var collectionGenres: UICollectionView!
    @IBOutlet weak var labelDescription: UILabel!
    @IBOutlet weak var labelRating: UILabel!
    @IBOutlet weak var labelPlaytime: UILabel!
    @IBOutlet weak var labelCreatorsCount: UILabel!
    @IBOutlet weak var collectionPlatfroms: UICollectionView!
    @IBOutlet weak var collectionStores: UICollectionView!
    @IBOutlet weak var youtubeView: YouTubePlayerView!
    @IBOutlet weak var buttonWebsite: UIButton!
    private var isFavorite = false
    let realm = try! Realm()
    
    var idGame : Int?
    private var input : DetailGameRequest?
    private var gameListGenre : [DetailGameGenresModel] = []
    private var gameListPlatfrom : [DetailGamePlatforms] = []
    private var gameListStore : [DetailGameStores] = []
    private var gameListModel : DetailGameModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.navigationController?.navigationBar.tintColor = UIColor.red
        self.backgroudImageAdditional.layer.cornerRadius = 4
        self.buttonWebsite.layer.cornerRadius = 4
        self.registerCell()
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.red]
        self.input?.doGetDetailGame(gameId: "\(idGame ?? 0)")
        self.input?.doGetDetailGameGenres(gameId: "\(idGame ?? 0)")
        self.input?.doGetDetailPlatfroms(gameId: "\(idGame ?? 0)")
        self.input?.doGetDetailStores(gameId: "\(idGame ?? 0)")
        self.bookmarkIcon()
        self.setFavorite()
        self.favoriteState(id: idGame ?? 0)
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
        let game = DetailGameModel(id: gameListModel?.id, name: gameListModel?.name, creators_count: gameListModel?.creators_count, background_image: gameListModel?.background_image, background_image_additional: gameListModel?.background_image_additional, released: gameListModel?.released, description: gameListModel?.description, website: gameListModel?.website, rating: gameListModel?.rating, clip: gameListModel?.clip, playtime: gameListModel?.playtime)
        
        let container = try! Container()
        try! container.write({ (transaction) in
            transaction.add(game)
        })
        self.setFavorite()
    }
    
    private func removeFavorite(){
        let deleteGame = self.realm.objects(DetailGameObject.self).filter("id = %@" , gameListModel?.id ?? 0).first
        try! self.realm.write {
            if let obj = deleteGame{
                realm.delete(obj)
            }
        }
        self.setFavorite()
        
    }
    
    func favoriteState(id : Int) -> DetailGameObject?{
        let fav = realm.objects(DetailGameObject.self).filter("id = %@" , id).first
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
    
    
    
    @IBAction func btnViewWebsite(_ sender: Any) {
        DetailGameWireframe.performToDetailWebview(url: gameListModel?.website, caller: self)
    }
    
    @IBAction func btnToFullText(_ sender: Any) {
        
        DetailGameWireframe.performToDetailTextview(text: gameListModel?.description, caller: self)
    }
    
    
    private func registerCell(){
        self.collectionGenres.delegate = self
        self.collectionGenres.dataSource = self
        self.collectionGenres.register(UINib.init(nibName: "DetailGenreCollectionCell", bundle: self.nibBundle), forCellWithReuseIdentifier: "DetailGenreCollectionCell")
        
        self.collectionPlatfroms.delegate = self
        self.collectionPlatfroms.dataSource = self
        self.collectionPlatfroms.register(UINib.init(nibName: "DetailGenreCollectionCell", bundle: self.nibBundle), forCellWithReuseIdentifier: "DetailGenreCollectionCell")
        
        self.collectionStores.delegate = self
        self.collectionStores.dataSource = self
        self.collectionStores.register(UINib.init(nibName: "DetailStoresCollectionCell", bundle: self.nibBundle), forCellWithReuseIdentifier: "DetailStoresCollectionCell")
    }
    
    private func loadItems(result : DetailGameModel?){
        self.backgroundImage.sd_imageIndicator = SDWebImageActivityIndicator.gray
        self.backgroudImageAdditional.sd_imageIndicator = SDWebImageActivityIndicator.gray
        self.backgroundImage.sd_setImage(with: URL(string: result?.background_image ?? ""), placeholderImage: UIImage(named: "broken-image"))
        self.backgroudImageAdditional.sd_setImage(with: URL(string: result?.background_image_additional ?? ""), placeholderImage: UIImage(named: "broken-image"))
        self.labelName.text = result?.name
        self.labelDate.text = result?.released
        self.labelDescription.text = result?.description
        self.labelRating.text = "\(result?.rating ?? 0.0)/5"
        self.labelCreatorsCount.text = "creators : \(result?.creators_count ?? 0)"
        self.youtubeView.loadVideoID(result?.clip ?? "")
        self.labelPlaytime.text = "\(result?.playtime ?? 0)"
        self.title = result?.name
    }
}

extension DetailGameVC : UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == collectionGenres{
            return gameListGenre.count
        }else if collectionView == collectionPlatfroms{
            return gameListPlatfrom.count
        }else{
            return gameListStore.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == collectionGenres {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DetailGenreCollectionCell", for: indexPath) as! DetailGenreCollectionCell
            cell.labelGenre.text = gameListGenre[indexPath.item].slug
            return cell
        }else if collectionView == collectionPlatfroms{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DetailGenreCollectionCell", for: indexPath) as! DetailGenreCollectionCell
            cell.labelGenre.text = gameListPlatfrom[indexPath.item].slug
            return cell
        }else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DetailStoresCollectionCell", for: indexPath) as! DetailStoresCollectionCell
            cell.labelStore.text = gameListStore[indexPath.item].name
            cell.imageStore.sd_imageIndicator = SDWebImageActivityIndicator.gray
            cell.imageStore.sd_setImage(with: URL(string: gameListStore[indexPath.item].imageBackgroud ?? ""), placeholderImage: UIImage(named: "broken-image"))
            cell.delegate = self
            cell.index = indexPath
            return cell
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 130, height: 170)
    }
    
    
    
}

extension DetailGameVC : DetailStoresCellDelegate{
    func didTapToWebview(index: Int?) {
        DetailGameWireframe.performToDetailWebview(url: gameListStore[index ?? 0].url, caller: self)
    }
}


extension DetailGameVC : DetailGameResponse {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.config(vc: self)
    }
    
    
    func config(vc : DetailGameVC){
        var request = DetailGamePresent()
        request.output = vc
        vc.input = request
    }
    
    func displayGetDetailGame(result: DetailGameModel) {
        print(result)
        self.gameListModel = result
        self.loadItems(result: result)
    }
    
    func displayGetDetailGameGenre(result: [DetailGameGenresModel]) {
        self.gameListGenre = result
        self.collectionGenres.reloadData()
    }
    
    func displayGetDetailGamePlatfrom(result: [DetailGamePlatforms]) {
        self.gameListPlatfrom = result
        self.collectionPlatfroms.reloadData()
    }
    
    func displayGetDetailGameStores(result: [DetailGameStores]) {
        self.gameListStore = result
        self.collectionStores.reloadData()
    }
    
    func displayError(message: String, object: Any) {
        
    }
    
    func resultRequest(request: DataRequest) {
        
    }
    
    
}

