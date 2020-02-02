//
//  LeagueCalendarTableView.swift
//  Footics
//
//  Created by 김주훈 on 2020/01/31.
//  Copyright © 2020 김주훈. All rights reserved.
//

import UIKit
import SwiftyJSON

struct Schedule: Codable{
    let league : String
    let hometeam : String
    let awayteam : String
    let date : String
    let time : String
    
    enum CodingKeys : String, CodingKey{
        case league = "league"
        case hometeam, awayteam, date, time
    }
}

class LeagueCalendarTableView: UIViewController {
    var schedules: [Schedule] = []
    var sections: [String] = ["England-Premier League", "Spain-Laliga", "Italy-SerieA", "Germany-Bundesliga", "France-League1"]

    
    @IBOutlet weak var premierTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let jsonDecoder = JSONDecoder()

        guard let scheduleData : NSDataAsset = NSDataAsset(name: "leagueSchedule") else{
                  return
              }
              do{
                  self.schedules = try jsonDecoder.decode([Schedule].self, from : scheduleData.data)

              }catch{
                  print(error)
              }                
      
         premierTable.delegate = self
         premierTable.dataSource = self
         
    }
    
    
}


extension LeagueCalendarTableView: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.schedules.count
    }
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        return Array(Set(self.sections.map{$0.first! })).count
    }
    
    public func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section]
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "scheduleList", for: indexPath) as! LeagueCalandarCell
        let scheduleRowData = self.schedules[indexPath.row]
        cell.dateLabel.text = scheduleRowData.date
        cell.homeTeamImage.image = UIImage(named: scheduleRowData.hometeam)
        cell.awayTeamImage.image = UIImage(named: scheduleRowData.awayteam)
        cell.timeLabel.text = scheduleRowData.time
        return cell
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        tableView.deselectRow(at: indexPath, animated: true)
//       
//    }
}
