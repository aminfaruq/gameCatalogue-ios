//
//  CreatorVC.swift
//  Game Catalogue
//
//  Created by Amin faruq on 08/07/20.
//  Copyright © 2020 Amin faruq. All rights reserved.
//

import UIKit
import Alamofire
import SDWebImage

class DeveloperVC: UIViewController {
    
    
    @IBOutlet weak var tableviewDevelopers: UITableView!
    @IBOutlet weak var _buttonPrev: UIButton!
    private var input : DeveloperListRequest?
    private var developerListModel : [DeveloperListModel] = []
    private var click = 1
    @IBOutlet weak var labelPage: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerCell()
        self.loadingProgress()
        self.input?.doGetDev(page: "\(click)")
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        
        self.labelPage.text = "Page \(click)"
        if(click == 1){
            _buttonPrev.isHidden = true
        }else if (click > 1){
            _buttonPrev.isHidden = false
        }
    }
    
    @IBAction func buttonNext(_ sender: UIButton) {
        click += 1
        self.input?.doGetDev(page: "\(click)")
        self.labelPage.text = "Page \(click)"
        self.loadingProgress()
        if(click == 1){
            _buttonPrev.isHidden = true
        }else if (click > 1){
            _buttonPrev.isHidden = false
        }
    }
    
    @IBAction func buttonPrev(_ sender: UIButton) {
        click -= 1
        self.input?.doGetDev(page: "\(click)")
        self.labelPage.text = "Page \(click)"
        self.loadingProgress()
        if(click == 1){
            _buttonPrev.isHidden = true
        }else if (click > 1){
            _buttonPrev.isHidden = false
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
        self.tableviewDevelopers.delegate = self
        self.tableviewDevelopers.dataSource = self
        self.tableviewDevelopers.register(UINib.init(nibName: "DeveloperCell", bundle: self.nibBundle), forCellReuseIdentifier: "DeveloperCell")
    }
    
}

extension DeveloperVC : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dismiss(animated: false, completion: nil)
        return developerListModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "DeveloperCell", for: indexPath) as! DeveloperCell
        
        cell.imageDev.sd_imageIndicator = SDWebImageActivityIndicator.gray
        cell.imageDev.sd_setImage(with: URL(string: developerListModel[indexPath.item].background_image ?? ""), placeholderImage: UIImage(named: "broken-image"))
        cell.labelGameCount.text = "Total Games : \(self.developerListModel[indexPath.item].games_count ?? 0)"
        cell.labelName.text = self.developerListModel[indexPath.item].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        DetailDeveloperWireframe.performToDetailDeveloper(developerId: developerListModel[indexPath.item].id, caller: self)
        
        tableviewDevelopers.deselectRow(at: indexPath, animated: true)
    }
    
    
}

extension DeveloperVC : DeveloperListResponse {
    override func awakeFromNib() {
        super.awakeFromNib()
        self.config(vc: self)
    }
    
    
    func config(vc : DeveloperVC){
        var request = DeveloperListPresent()
        request.output = vc
        vc.input = request
    }
    
    func displayGetDevOne(result: [DeveloperListModel]) {
        self.developerListModel = result
        self.tableviewDevelopers.reloadData()
    }
    
    func displayError(message: String, object: Any) {}
    
    func resultRequest(request: DataRequest) {}
    
    
}


