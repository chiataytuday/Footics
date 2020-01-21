//
//  ImageViewerViewController.swift
//  Footics
//
//  Created by 김주훈 on 2020/01/18.
//  Copyright © 2020 김주훈. All rights reserved.
//

import UIKit

class ImageViewerViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var teamNameLabel: UILabel!
    @IBOutlet weak var teamLeagueLabel: UILabel!
    @IBOutlet weak var teamSquadTable: UITableView!
    @IBOutlet weak var teamCountryLabel: UILabel!
    
    var imageName: String!
    var ClubName = ""
    var leagueName = ""
    var CountryName = ""
    
    var sections: [String] = ["Head Coach", "GoalKeeper", "Defender", "Midfielder", "Forward"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        teamNameLabel.text = imageName
        teamLeagueLabel.text = leagueName
        teamCountryLabel.text = CountryName
        ClubName = imageName
        setupImageView()
        
        teamSquadTable.delegate = self
        teamSquadTable.dataSource = self
    }
    
    private func setupImageView(){
        guard let name = imageName else{
            return }
        if let image = UIImage(named: name){
            imageView.image = image
        }
    }
    
    
    @IBAction func teamSelectButton(_ sender: UIButton) {
    }
    
}

extension ImageViewerViewController: UITableViewDelegate, UITableViewDataSource{
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        return Array(Set(self.sections.map{$0.first! })).count
    }
    
    public func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section]
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let charactor = Array(Set(self.sections.map{$0.first!}))[indexPath.section]
        let cell = tableView.dequeueReusableCell(withIdentifier: "teamMember", for: indexPath)
        cell.textLabel?.text = self.sections.filter{$0.first == charactor}[indexPath.row]
        return cell
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        let charactor = Array(Set(self.sections.map{ $0.first!})).sorted()[section]
        return self.sections.filter{$0.first! == charactor}.count
    }
    
}
