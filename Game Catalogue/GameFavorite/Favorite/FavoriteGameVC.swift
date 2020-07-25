//
//  FavoriteGameVC.swift
//  Game Catalogue
//
//  Created by Amin faruq on 22/07/20.
//  Copyright © 2020 Amin faruq. All rights reserved.
//

import UIKit
import RealmSwift
import SDWebImage

class FavoriteGameVC: UIViewController {
    
    @IBOutlet weak var tableviewGames: UITableView!
    var gamesItems : Results<DetailGameObject>?
    let realm = try! Realm()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerCell()
        self.loadGame()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.loadGame()
    }
    
    private func registerCell(){
        
        self.tableviewGames.delegate = self
        self.tableviewGames.dataSource = self
        self.tableviewGames.register(UINib.init(nibName: "SearchCell", bundle: self.nibBundle), forCellReuseIdentifier: "SearchCell")
    }
    
    
    private func loadGame(){
        gamesItems = realm.objects(DetailGameObject.self)
        tableviewGames.reloadData()
    }
    
    
}

extension FavoriteGameVC : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if gamesItems?.count == 0 {
            self.tableviewGames.setEmptyMessage("Favorite games is empty")
        }else{
            self.tableviewGames.restore()
            dismiss(animated: false, completion: nil)
        }
        
        return gamesItems?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
          let cell = tableView.dequeueReusableCell(withIdentifier: "SearchCell", for: indexPath) as! SearchCell
        
        if let items = gamesItems?[indexPath.row]{
            cell.imageName.sd_imageIndicator = SDWebImageActivityIndicator.gray

            cell.imageName.sd_setImage(with: URL(string: items.background_image), placeholderImage: UIImage(named: "broken-image"))
            cell.labelName.text = items.name
            cell.labelDate.text = items.released
            cell.labelRating.text = "\(items.rating)"
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let items = gamesItems?[indexPath.row]{
            DetailGameWireframe.performToDetailGame(gameId: items.id, caller: self)
        }
        tableviewGames.deselectRow(at: indexPath, animated: true)
    }
    
    
}

