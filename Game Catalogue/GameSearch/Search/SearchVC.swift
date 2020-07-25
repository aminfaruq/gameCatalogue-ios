//
//  SearchVC.swift
//  Game Catalogue
//
//  Created by Amin faruq on 07/07/20.
//  Copyright © 2020 Amin faruq. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import SDWebImage

class SearchVC: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableviewGame: UITableView!
    var input : SearchListRequest?
    var searchListModel : [SearchModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.navigationController?.navigationBar.tintColor = UIColor.red
        self.registerCell()
    }
    
    private func registerCell(){
        self.searchBar.delegate = self
        self.tableviewGame.delegate = self
        self.tableviewGame.dataSource = self
        self.tableviewGame.register(UINib.init(nibName: "SearchCell", bundle: self.nibBundle), forCellReuseIdentifier: "SearchCell")
    }
    
}

extension SearchVC : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if searchListModel.count == 0 {
            self.tableviewGame.setEmptyMessage("The search is still empty")
        }else{
            self.tableviewGame.restore()
            dismiss(animated: false, completion: nil)

        }
        return searchListModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchCell", for: indexPath) as! SearchCell
        
        cell.imageName.sd_imageIndicator = SDWebImageActivityIndicator.gray
        cell.imageName.sd_setImage(with: URL(string: searchListModel[indexPath.item].background_image ?? ""), placeholderImage: UIImage(named: "broken-image"))
        cell.labelName.text = self.searchListModel[indexPath.item].name
        cell.labelDate.text = self.searchListModel[indexPath.item].released
        cell.labelRating.text = "\(self.searchListModel[indexPath.item].rating ?? 0.00)"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        DetailGameWireframe.performToDetailGame(gameId: searchListModel[indexPath.item].id, caller: self)
        tableviewGame.deselectRow(at: indexPath, animated: true)
    }
    
    
}

extension SearchVC : UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        let alert = UIAlertController(title: nil, message: "Please wait...", preferredStyle: .alert)

        let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.style = UIActivityIndicatorView.Style.medium
        loadingIndicator.startAnimating();
        input?.doGetSearchList(query: searchBar.text!)
        alert.view.addSubview(loadingIndicator)
        present(alert, animated: true, completion: nil)
        tableviewGame.reloadData()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text?.count == 0 {
            // loadItems()
            tableviewGame.reloadData()
            DispatchQueue.main.async {
                searchBar.resignFirstResponder()
            }
            
        }
    }
}

extension SearchVC : SearchListResponse {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.config(vc: self)
    }
    
    
    func config(vc : SearchVC){
        var request = SearchListPresent()
        request.output = vc
        vc.input = request
    }
    
    func displayGetSearchList(result: [SearchModel]) {
        self.searchListModel = result
        self.tableviewGame.reloadData()
    }
    
    func displayError(message: String, object: Any) {}
    
    func resultRequest(request: DataRequest) {}
    
    
}
