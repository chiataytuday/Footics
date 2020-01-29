//
//  ResultPredictViewController.swift
//  Footics
//
//  Created by 김주훈 on 2020/01/21.
//  Copyright © 2020 김주훈. All rights reserved.
//

import UIKit

class ResultPredictViewController: UIViewController{
    var teamOne = ""
    var teamTwo = ""
    @IBOutlet weak var teamOneName: UILabel!
    @IBOutlet weak var teamOneScore: UILabel!
    @IBOutlet weak var teamOneWinRate: UILabel!
    
    @IBOutlet weak var DrawRate: UILabel!
    
    @IBOutlet weak var teamTwoName: UILabel!
    @IBOutlet weak var teamTwoScore: UILabel!
    
    @IBOutlet weak var teamOneLogo: UIImageView!
    
    @IBOutlet weak var teamTwoLogo: UIImageView!
    @IBOutlet weak var teamTwoWinRate: UILabel!
    @IBOutlet weak var VictoryRateBar: UIProgressView!
    
    
    override func viewDidLoad() {
            super.viewDidLoad()
        teamOneName.text = teamOne
        teamTwoName.text = teamTwo
        teamOneLogo.image = UIImage(named: teamOne)
        teamTwoLogo.image = UIImage(named: teamTwo)
        teamOneScore.text = String(2)
        teamTwoScore.text = String(3)
        
        //예상 승율
        
        var homewin: Float = 0.30 // 홈 팀이 이길 확율
        var awaywin: Float = 0.43 // 홈 팀이 이길 확율
        
        VictoryRateBar.setProgress(homewin, animated: false)
        VictoryRateBar.transform = VictoryRateBar.transform.scaledBy(x: 1, y: 8)
        
        teamOneWinRate.text = "홈 승리: " + Int(homewin * 100).description + "%"
        teamTwoWinRate.text = "어웨이 승리: " + Int(awaywin * 100).description + "%"
        DrawRate.text = "무승부: " + Int((1 - homewin - awaywin) * 100).description + "%"
        
        }
}
