//
//  CreatorVC.swift
//  Game Catalogue
//
//  Created by Amin faruq on 08/07/20.
//  Copyright © 2020 Amin faruq. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import SDWebImage

class CreatorVC: UIViewController {
    
    @IBOutlet weak var tableCreators: UITableView!
    @IBOutlet weak var labelpage: UILabel!
    @IBOutlet weak var buttonPrev: UIButton!
    private var input : CreatorsListRequest?
    private var creatorListModel : [CreatorListModel] = []
    private var click = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerCell()
        self.loadingProgress()
        self.input?.doGetCreatorList(page: "\(click)")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    
        self.labelpage.text = "Page \(click)"
        
        if(click == 1){
            buttonPrev.isHidden = true
        }else if (click > 1){
            buttonPrev.isHidden = false
        }
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
    
    private func registerCell(){
        self.tableCreators.delegate = self
        self.tableCreators.dataSource = self
        self.tableCreators.register(UINib.init(nibName: "CreatorCell", bundle: self.nibBundle), forCellReuseIdentifier: "CreatorCell")
    }
    
    @IBAction func btnPrev(_ sender: UIButton) {
        click -= 1
        self.input?.doGetCreatorList(page: "\(click)")
        self.labelpage.text = "Page \(click)"
        self.loadingProgress()
        if(click == 1){
            buttonPrev.isHidden = true
        }else if (click > 1){
            buttonPrev.isHidden = false
        }
    }
    
    @IBAction func btnNext(_ sender: UIButton) {
        click += 1
        self.input?.doGetCreatorList(page: "\(click)")
        self.labelpage.text = "Page \(click)"
        self.loadingProgress()
        if(click == 1){
            buttonPrev.isHidden = true
        }else if (click > 1){
            buttonPrev.isHidden = false
        }
        
    }
    
    
}

extension CreatorVC : UITableViewDelegate , UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dismiss(animated: false, completion: nil)
        return creatorListModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CreatorCell", for: indexPath) as! CreatorCell
        cell.labelName.text = self.creatorListModel[indexPath.item].name
        
        cell.labelGamesCount.text = "Total Games : \(self.creatorListModel[indexPath.item].games_count ?? 0)"
        cell.imageCreators.sd_imageIndicator = SDWebImageActivityIndicator.gray
        
        cell.imageCreators.sd_setImage(with: URL(string: creatorListModel[indexPath.item].background_image ?? ""), placeholderImage: UIImage(named: "broken-image"))
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        DetailCreatorWireframe.performToDetailCreators(creatorId: creatorListModel[indexPath.item].id, caller: self)
        
        self.tableCreators.deselectRow(at: indexPath, animated: true)
    }
    
    
}

extension CreatorVC : CreatorListResponse {
    override func awakeFromNib() {
        super.awakeFromNib()
        self.config(vc: self)
    }
    
    
    func config(vc : CreatorVC){
        var request = CreatorListPresent()
        request.output = vc
        vc.input = request
    }
    
    func displayGetCreator(result: [CreatorListModel]) {
        self.creatorListModel = result
        self.tableCreators.reloadData()
    }
    
    func displayError(message: String, object: Any) {}
    
    func resultRequest(request: DataRequest) {}
}
