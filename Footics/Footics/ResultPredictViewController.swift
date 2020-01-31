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
    
    @IBOutlet weak var teamTwoName: UILabel!
    
    @IBOutlet weak var teamOneLogo: UIImageView!
    
    @IBOutlet weak var teamTwoLogo: UIImageView!
    
    override func viewDidLoad() {
            super.viewDidLoad()
        teamOneName.text = teamOne
        teamTwoName.text = teamTwo
        teamOneLogo.image = UIImage(named: teamOne)
        teamTwoLogo.image = UIImage(named: teamTwo)
        }
}
