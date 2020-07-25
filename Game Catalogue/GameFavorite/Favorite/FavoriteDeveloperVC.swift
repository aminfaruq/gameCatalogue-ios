//
//  FavoriteDeveloperVC.swift
//  Game Catalogue
//
//  Created by Amin faruq on 22/07/20.
//  Copyright © 2020 Amin faruq. All rights reserved.
//

import UIKit
import RealmSwift
import SDWebImage

class FavoriteDeveloperVC: UIViewController {
    
    @IBOutlet weak var tableFavDeveloper: UITableView!
    var developerItems : Results<DetailDeveloperObject>?
    let realm = try! Realm()


    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerCell()
        self.loadDeveloper()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.loadDeveloper()
    }
    
    private func registerCell(){
        self.tableFavDeveloper.delegate = self
        self.tableFavDeveloper.dataSource = self
        self.tableFavDeveloper.register(UINib.init(nibName: "DeveloperCell", bundle: self.nibBundle), forCellReuseIdentifier: "DeveloperCell")
    }
    
    private func loadDeveloper(){
        developerItems = realm.objects(DetailDeveloperObject.self)
        tableFavDeveloper.reloadData()
    }
    
}

extension FavoriteDeveloperVC : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if developerItems?.count == 0{
            self.tableFavDeveloper.setEmptyMessage("Favorite developers is empty")
        }else{
            self.tableFavDeveloper.restore()
            dismiss(animated: false, completion: nil)

        }
        
        return developerItems?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DeveloperCell", for: indexPath) as! DeveloperCell
        
        if let items = developerItems?[indexPath.row]{
            
            cell.imageDev.sd_imageIndicator = SDWebImageActivityIndicator.gray
            cell.imageDev.sd_setImage(with: URL(string: items.image_background), placeholderImage: UIImage(named: "broken-image"))
            cell.labelGameCount.text = "Total Games : \(items.games_count)"
            cell.labelName.text = items.name
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let items = developerItems?[indexPath.row]{

            DetailDeveloperWireframe.performToDetailDeveloper(developerId: items.id, caller: self)
            
        }
        
        tableFavDeveloper.deselectRow(at: indexPath, animated: true)
    }
    
    
}
