//
//  FavoriteCreatorVC.swift
//  Game Catalogue
//
//  Created by Amin faruq on 22/07/20.
//  Copyright © 2020 Amin faruq. All rights reserved.
//

import UIKit
import RealmSwift
import SDWebImage

class FavoriteCreatorVC: UIViewController {
    
    @IBOutlet weak var tableviewCreators: UITableView!
    var creatorItems : Results<DetailCreatorObject>?
    let realm = try! Realm()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerCell()
        self.loadCreators()
    }
    
    private func registerCell(){
        self.tableviewCreators.delegate = self
        self.tableviewCreators.dataSource = self
        self.tableviewCreators.register(UINib.init(nibName: "CreatorCell", bundle: self.nibBundle), forCellReuseIdentifier: "CreatorCell")
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.loadCreators()
    }
    
    
    private func loadCreators(){
        creatorItems = realm.objects(DetailCreatorObject.self)
        tableviewCreators.reloadData()
    }
    
    
}

extension FavoriteCreatorVC : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if creatorItems?.count == 0 {
            self.tableviewCreators.setEmptyMessage("Favorite creators is empty")
        }else {
            self.tableviewCreators.restore()
            dismiss(animated: false, completion: nil)
        }
        
        return creatorItems?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CreatorCell", for: indexPath) as! CreatorCell
        
        if let items = creatorItems?[indexPath.row]{
            cell.imageCreators.sd_imageIndicator = SDWebImageActivityIndicator.gray
            cell.imageCreators.sd_setImage(with: URL(string: items.background_image), placeholderImage: UIImage(named: "broken-image"))
            cell.labelName.text = items.name
            cell.labelGamesCount.text = "Total Games : \(items.creators_count)"
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let items = creatorItems?[indexPath.row]{
            DetailCreatorWireframe.performToDetailCreators(creatorId: items.id, caller: self)
        }
        
        tableviewCreators.deselectRow(at: indexPath, animated: true)
    }
    
    
}
