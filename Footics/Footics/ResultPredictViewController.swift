//
//  ResultPredictViewController.swift
//  Footics
//
//  Created by 오서택 on 2020/01/21.
//  Copyright © 2020 오서택. All rights reserved.
//

import UIKit

class ResultPredictViewController: UIViewController{
    var teamOne = ""
    var teamTwo = ""
    
    var homewin: Float = 0.0 // 홈 팀이 이길 확률
    var draw: Float = 0.0 // 비길 확률
    var awaywin: Float = 0.0 // 홈 팀이 이길 확률
    
    var teamOneGoal = 0 // 팀 1 득점
    var teamTwoGoal = 0 // 팀 2 득점
    
    @IBOutlet weak var teamOneName: UILabel!
    @IBOutlet weak var teamOneScore: UILabel!
    @IBOutlet weak var teamOneWinRate: UILabel!
    
    @IBOutlet weak var DrawRate: UILabel!
    
    @IBOutlet weak var teamTwoName: UILabel!
    @IBOutlet weak var teamTwoScore: UILabel!
    
    @IBOutlet weak var teamOneLogo: UIImageView!
    
    @IBOutlet weak var teamTwoLogo: UIImageView!
    @IBOutlet weak var teamTwoWinRate: UILabel!
    
    @IBOutlet weak var VictoryRateBar1: UIProgressView!
    @IBOutlet weak var VictoryRateBar2: UIProgressView!
    @IBOutlet weak var VictoryRateBar3: UIProgressView!
    @IBOutlet weak var VictoryRateBarStack: UIStackView!
    
    @IBOutlet weak var recentMatchTableView: UITableView!
    
    @IBOutlet weak var VictoryRateBar1_constr: NSLayoutConstraint!
    @IBOutlet weak var VictoryRateBar2_constr: NSLayoutConstraint!
    @IBOutlet weak var VictoryRateBar3_constr: NSLayoutConstraint!
    
    @IBOutlet weak var VictoryRateBar_trailing_constr: NSLayoutConstraint!
    @IBOutlet weak var VictoryRateBar_leading_constr: NSLayoutConstraint!
    
    override func viewDidLoad() {
            super.viewDidLoad()
        
        teamOneName.text = teamOne
        teamTwoName.text = teamTwo
        
        teamOneLogo.image = UIImage(named: teamOne)
        teamTwoLogo.image = UIImage(named: teamTwo)
        
        // 아래에 학습된 모델에서 나온 결과를 반영하면 됨
        // 예상 득점
        teamOneGoal = 2 // 팀 1 득점
        teamTwoGoal = 3 // 팀 2 득점
        
        // 예상 승률 (합계 1.0)
        homewin = 0.45 // 팀 1 승리 확률
        draw = 0.10 // 무승부 확률
        awaywin = 0.45 // 팀 2 승리 확률
        // 여기 까지!
        
        // 예상 득점 설정
        teamOneScore.text = String(teamOneGoal) // 팀 1 득점
        teamTwoScore.text = String(teamTwoGoal) // 팀 2 득점
        
        let view_width = view.bounds.size.width // 현재 기기의 width 알아내기
        
        VictoryRateBar1_constr.constant = (view_width + VictoryRateBar_trailing_constr.constant - VictoryRateBar_leading_constr.constant) * CGFloat(homewin) // 팀1 승리 확률 막대 길이 조정
        VictoryRateBar2_constr.constant = (view_width + VictoryRateBar_trailing_constr.constant - VictoryRateBar_leading_constr.constant) * CGFloat(draw) // 무승보 확률 막대 길이 조정
        VictoryRateBar3_constr.constant = (view_width + VictoryRateBar_trailing_constr.constant - VictoryRateBar_leading_constr.constant) * CGFloat(awaywin) // 팀2 승리 확률 막대 길이 조정
        
        // 막대 크기 설정
        VictoryRateBar1.setProgress(1, animated: false)
        VictoryRateBar1.transform = VictoryRateBar1.transform.scaledBy(x: 1, y: 8)
        VictoryRateBar2.setProgress(1, animated: false)
        VictoryRateBar2.transform = VictoryRateBar2.transform.scaledBy(x: 1, y: 8)
        VictoryRateBar3.setProgress(1, animated: false)
        VictoryRateBar3.transform = VictoryRateBar3.transform.scaledBy(x: 1, y: 8)
        
        // 확률 텍스트로 출력
        teamOneWinRate.text = "홈 승리: " + Int(homewin * 100).description + "%" // 팀1 승리 확률
        teamTwoWinRate.text = "어웨이 승리: " + Int(awaywin * 100).description + "%" // 무승부 확률
        DrawRate.text = "무승부: " + Int(draw * 100).description + "%" // 팀2 승리 확률
        }
    
}
