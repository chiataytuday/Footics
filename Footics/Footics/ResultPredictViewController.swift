//
//  ResultPredictViewController.swift
//  Footics
//
//  Created by 김주훈 on 2020/01/21.
//  Copyright © 2020 김주훈. All rights reserved.
//

import UIKit
import CoreML

class ResultPredictViewController: UIViewController{
    var teamOne = ""
    var teamTwo = ""
    @IBOutlet weak var teamOneName: UILabel!
    
    @IBOutlet weak var teamTwoName: UILabel!
    
    @IBOutlet weak var teamOneLogo: UIImageView!
    
    @IBOutlet weak var teamTwoLogo: UIImageView!
    
    
    let mlModel = MyTabularClassifier_1()
    let homeScoreModel = HomeScore_1()
    var temp = 0
    var homeScore = 0
    var resultDict = [String: Double]()

    
    override func viewDidLoad() {
            super.viewDidLoad()
        teamOneName.text = teamOne
        teamTwoName.text = teamTwo
        teamOneLogo.image = UIImage(named: teamOne)
        teamTwoLogo.image = UIImage(named: teamTwo)
        
        let prediction = try? mlModel.prediction(input: MyTabularClassifier_1Input(home_team: teamOne, away_team: teamTwo))
        let homePrediction = try? homeScoreModel.prediction(input: HomeScore_1Input(home_team: teamOne, away_team: teamTwo))
        
        print(prediction!.result)
        print(prediction!.resultProbability)
        print(homePrediction!.home_goals)
        
        homeScore = Int(round(homePrediction!.home_goals))
        resultDict = prediction!.resultProbability
        print(homeScore)
        for (key,value) in resultDict{
            if(key == "H"){
                temp = Int(value * 100)
                print("홈 팀이 이길확률 \(temp)%")
            }else if(key == "A"){
                temp = Int(value * 100)
                print("어웨이 팀이 이길확률 \(temp)%")
            }else{
                temp = Int(value * 100)
                print("경기가 무승부일 확률 \(temp)%")
            }
        }

        
        }
}
