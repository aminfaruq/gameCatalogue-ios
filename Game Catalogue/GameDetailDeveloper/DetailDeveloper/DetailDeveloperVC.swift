//
//  DetailDeveloperVC.swift
//  Game Catalogue
//
//  Created by Amin faruq on 12/07/20.
//  Copyright © 2020 Amin faruq. All rights reserved.
//

import UIKit
import SDWebImage
import Alamofire
import RealmSwift
import Realm

class DetailDeveloperVC: UIViewController {
    
    @IBOutlet weak var imageName: UIImageView!
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelDescription: UILabel!
    @IBOutlet var barButtonItem: UIBarButtonItem!
    var developerId : Int?
    private var input : DetailDeveloperRequest?
    private var isFavorite = false
    private var detailDeveloper : DetailDeveloperModel?
    let realm = try! Realm()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.navigationController?.navigationBar.tintColor = UIColor.red
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.red]
        
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
        self.imageName.layer.cornerRadius = 12
        self.input?.doGetDetailDeveloper(developerId: "\(developerId ?? 0)")
        self.setFavorite()
        self.favoriteState(id: developerId ?? 0)
    }
    
    private func loadItems(result : DetailDeveloperModel?){
        
        self.imageName.sd_imageIndicator = SDWebImageActivityIndicator.gray
        self.imageName.sd_setImage(with: URL(string: result?.image_background ?? ""), placeholderImage: UIImage(named: "broken-image"))
        self.labelName.text = result?.slug
        self.labelDescription.text = result?.description
        self.title = result?.name
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
    
    
     func favoriteState(id : Int) -> DetailDeveloperObject?{
        let fav = realm.objects(DetailDeveloperObject.self).filter("id = %@" , id).first
        if  fav?.id != nil{
            isFavorite = true
            setFavorite()
        }
        return fav
    }
    
    
    private func saveFavorite(){
        let developer = DetailDeveloperModel(id: detailDeveloper?.id, name: detailDeveloper?.name, slug: detailDeveloper?.slug, games_count:detailDeveloper?.games_count, image_background: detailDeveloper?.image_background, description:detailDeveloper?.description)
        
        let container = try! Container()
        try! container.write({ (transaction) in
            transaction.add(developer)
        })
        self.setFavorite()
    }
    
    private func removeFavorite(){
        let deleteDeveloper = self.realm.objects(DetailDeveloperObject.self).filter("id = %@" , detailDeveloper?.id ?? 0).first
        try! self.realm.write {
            if let obj = deleteDeveloper{
                realm.delete(obj)
            }
        }
        self.setFavorite()
        
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

extension DetailDeveloperVC : DetailDeveloperResponse{
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.config(vc: self)
    }
    
    
    func config(vc : DetailDeveloperVC){
        var request = DetailDeveloperPresent()
        request.output = vc
        vc.input = request
    }
    
    func displayGetDetailDeveloper(result: DetailDeveloperModel) {
        self.loadItems(result: result)
        self.detailDeveloper = result
    }
    
    func displayError(message: String, object: Any) {
        
    }
    
    func resultRequest(request: DataRequest) {
        
    }
    
    
}
