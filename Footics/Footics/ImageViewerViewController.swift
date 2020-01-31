//
//  ImageViewerViewController.swift
//  Footics
//
//  Created by 김주훈 on 2020/01/18.
//  Copyright © 2020 김주훈. All rights reserved.
//

import UIKit
import SwiftyJSON

struct Club: Codable{
    struct Defender: Codable{
        let number: Int
        let country: String
        let name: String
        
        enum CodingKeys : String, CodingKey{
            case number = "number"
            case country
            case name
        }
    }

    struct GoalKeeper: Codable{
        let number: Int
        let country: String
        let name: String
        
        enum CodingKeys : String, CodingKey{
            case number = "number"
            case country
            case name
        }
    }

    struct Forward: Codable{
        let number: Int
        let country: String
        let name: String
        
        enum CodingKeys : String, CodingKey{
            case number = "number"
            case country
            case name
        }
    }

    struct Midfielder: Codable{
        let number: Int
        let country: String
        let name: String
        
        enum CodingKeys : String, CodingKey{
            case number = "number"
            case country
            case name
        }
    }

    let ClubName: String
    let Ground: String
    let HeadCoach: String
    let Defender: [Defender]
    let Forward: [Forward]
    let GoalKeeper: [GoalKeeper]
    let Midfielder: [Midfielder]

}

class ImageViewerViewController: UIViewController {
    
    var clubs: [Club] = []
    var defenderList = [[String: Any]]()
    var midfielderList = [[String: Any]]()
    var goalkeeperList = [[String: Any]]()
    var forwardList = [[String: Any]]()
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var teamNameLabel: UILabel!
    @IBOutlet weak var teamLeagueLabel: UILabel!
    @IBOutlet weak var teamSquadTable: UITableView!
    @IBOutlet weak var teamCountryLabel: UILabel!
   
    
    var imageName: String!
    var ClubName = ""
    var leagueName = ""
    var CountryName = ""
    var HeadCoach = ""
    var Ground = ""
    var tempNum = ""
    
    var sections: [String] = ["HeadCoach", "GoalKeeper", "Defender", "Midfielder", "Forward"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        teamNameLabel.text = imageName
        teamLeagueLabel.text = leagueName
        teamCountryLabel.text = CountryName
        ClubName = imageName
        
        let jsonDecoder = JSONDecoder()

        guard let clubData : NSDataAsset = NSDataAsset(name: "\(leagueName).json") else{
                  return
              }
              do{
                  self.clubs = try jsonDecoder.decode([Club].self, from : clubData.data)

              }catch{
                  print(error)
              }

              for key in clubs{
                if(ClubName == key.ClubName) {
                    HeadCoach = key.HeadCoach
                    Ground = key.Ground
                  for i in 0 ..< (key.Defender.count){
                      defenderList.append(["Number" : key.Defender[i].number, "Name" : key.Defender[i].name, "Country" : key.Defender[i].country                ])
                  }
                  for j in 0 ..< (key.Forward.count){
                      forwardList.append(["Number" : key.Forward[j].number, "Name" : key.Forward[j].name, "Country" : key.Forward[j].country                ])
                  }
                  for x in 0 ..< (key.Midfielder.count){
                      midfielderList.append(["Number" : key.Midfielder[x].number, "Name" : key.Midfielder[x].name, "Country" : key.Midfielder[x].country                ])
                  }
                  for y in 0 ..< (key.GoalKeeper.count){
                      goalkeeperList.append(["Number" : key.GoalKeeper[y].number, "Name" : key.GoalKeeper[y].name, "Country" : key.GoalKeeper[y].country                ])
                  }
                    
                }
        }
        teamSquadTable.delegate = self
        teamSquadTable.dataSource = self
        
        setupImageView()
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
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        if section == 0{
            return 1
        }else if section == 1{
            return goalkeeperList.count
        }else if section == 2{
            return defenderList.count
        }else if section == 3{
            return midfielderList.count
        }else if section == 4{
            return forwardList.count
        }else{
            return 0
        }
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let playerCell = tableView.dequeueReusableCell(withIdentifier: "teamMember", for: indexPath) as! ImageViewerCell
        switch indexPath.section{
        case 0:
            playerCell.playerNameLabel?.text = HeadCoach
            playerCell.playerNumberLabel?.text = ""
            playerCell.playerCountryLabel?.text = ""
        case 1:
            let dictionary = self.goalkeeperList[(indexPath as NSIndexPath).row]
            playerCell.playerNameLabel?.text = dictionary["Name"] as? String
            tempNum = "\(dictionary["Number"]!)"
            playerCell.playerNumberLabel?.text = tempNum
            playerCell.playerCountryLabel?.text = dictionary["Country"] as? String
        case 2:
            let dictionary = self.defenderList[(indexPath as NSIndexPath).row]
            playerCell.playerNameLabel?.text = dictionary["Name"] as? String
            tempNum = "\(dictionary["Number"]!)"
            playerCell.playerNumberLabel?.text = tempNum
            playerCell.playerCountryLabel?.text = dictionary["Country"] as? String
        case 3:
            let dictionary = self.midfielderList[(indexPath as NSIndexPath).row]
            playerCell.playerNameLabel?.text = dictionary["Name"] as? String
            tempNum = "\(dictionary["Number"]!)"
            playerCell.playerNumberLabel?.text = tempNum
            playerCell.playerCountryLabel?.text = dictionary["Country"] as? String
        case 4:
            let dictionary = self.forwardList[(indexPath as NSIndexPath).row]
            playerCell.playerNameLabel?.text = dictionary["Name"] as? String
            tempNum = "\(dictionary["Number"]!)"
            playerCell.playerNumberLabel?.text = tempNum
            playerCell.playerCountryLabel?.text = dictionary["Country"] as? String
        default:
            break
        }
        return playerCell
    }
    

    
}
