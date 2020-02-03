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

    
    let mlModel = Classification()
    let homeScoreModel = HomeScore()
    let awayScoreModel = HomeScore_3()
    var temp = [String]()
    var home = ""
    var away = ""
    var draw = ""
    var homeScore = 0
    var awayScore = 0
    var homeClub = ""
    var awayClub = ""
    var resultDict = [String: Double]()
    
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
            for i in schedules{
                homeClub = i.hometeam
                awayClub = i.awayteam
                let prediction = try? mlModel.prediction(input: ClassificationInput(home_team: homeClub, away_team: awayClub))
                let homePrediction = try? homeScoreModel.prediction(input: HomeScoreInput(home_team: homeClub, away_team: awayClub))
                let awayPrediction =   try? awayScoreModel.prediction(input: HomeScore_3Input(home_team: homeClub, away_team: awayClub))
                
                homeScore = Int(round(homePrediction!.home_goals))
                awayScore = Int(round(awayPrediction!.away_goals))

                resultDict = prediction!.resultProbability
                print(homeScore, awayScore)
                for (key,value) in resultDict{
                    if(key == "H"){
                        home = "홈 승리: " + Int(value * 100).description + "% " // 팀1 승리 확률
                    }else if(key == "A"){
                        away = "어웨이 승리: " + Int(value * 100).description + "% " // 무승부 확률
                    }else{
                        draw = "무승부: " + Int(value * 100).description + "% " // 팀2 승리 확률
                    }
                }
//        temp = home + away + draw
        temp.append("예측 결과 : \(homeScore) vs \(awayScore)")
//        print(temp)
        }
        
         premierTable.delegate = self
         premierTable.dataSource = self
    }
}

extension LeagueCalendarTableView: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return self.schedules.count
        return self.schedules.count
    }
    
//    public func numberOfSections(in tableView: UITableView) -> Int {
//        return Array(Set(self.sections.map{$0.first! })).count
//    }
//
//    public func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return sections[section]
//    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "scheduleList", for: indexPath) as! LeagueCalandarCell
        let scheduleRowData = self.schedules[indexPath.row]
        cell.dateLabel.text = scheduleRowData.date
        cell.homeTeamImage.image = UIImage(named: scheduleRowData.hometeam)
        cell.awayTeamImage.image = UIImage(named: scheduleRowData.awayteam)
        cell.timeLabel.text = scheduleRowData.time
        cell.resultLabel.text = temp[indexPath.row]
        return cell
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        tableView.deselectRow(at: indexPath, animated: true)
//       
//    }
}
