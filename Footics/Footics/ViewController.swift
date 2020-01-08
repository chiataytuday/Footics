//
//  ViewController.swift
//  Footics
//
//  Created by 김주훈 on 2020/01/08.
//  Copyright © 2020 김주훈. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    class League {
        let england = "Premier League"
        let italy = "Serie A"
        let france = "League 1"
        let german = "Bundesliga"
        let spain = "Laliga"
        let champions = "Champions League"
        let Europa = "Europa League"
    }
    
    let premier = ["Manchester United", "Arsenal", "Aston Villa", "AFC Bournemouth", "Brighton and Hove Albion", "Burnley", "Chelsea", "Crystal Palace", "Everton", "Leicester City", "Liverpool", "Manchester City", "Newcastle United", "Norwich City", "Sheffield United", "Southampton", "Tottenham Hotspur", "Watford", "West Ham United", "Wolverhampton Wanderers"]
    let serie = ["Juventus", "Internazionale", "Lazio", "Roma", "Atlanta", "Bologna", "Brescia", "Cagliari", "Florentina", "Geona", "Hellas Verona", "Lecce", "Milan", "Napoli", "Parma", "Sampdoria", "Sassuolo", "SPAL", "Torino", "Udinese"]
    let league1 = ["Paris Saint-Germain", "Olympique de Marseille", "Stade Rennais FC", "LOSC", "FC Nantes", "Stade de Reims", "AS Monaco", "Angers SCO", "Montpellier Herault SC", "OGC Nice", "RC Strasbourg Alsace", "Olympique Lyonnais", "Girondins de Bordeaux", "AS Saint-Etienne", "Stade Brestois 29", "Dijon FCO", "FC Metz", "Amiens SC", "Nimes Olympique", "Toulouse FC"]
    let bundes = ["FC Bayern Munchen", "Borussia Dortmund", "RB Leipzig", "Bayer 04 Leverkusen", "Borussia Monchengladbach", "VfL Wolfsburg", "Eintracht Frankfurt", "SV Werder Bremen", "TSG 1899 Hoffenheim", "Fortuna Düsseldorf", "Hertha Berlin", "FSV Mainz 05", "Sport-Club Freiburg", "FC Schalke 04", "FC Augsburg", "FC Koln", "SC Paderborn 07", "FC Union Berlin"]
    let laliga = ["Real Madrid","Athletic Club","Atletico de Madrid","C.A. Osasuna","CD Leganes", "D. Alaves", "FC Barcelona","Getafe CF", "Granada CF" ,"Levante UD","RC Celta","RCD Espanyol de Barcelona" ,"RCD Mallorca","Real Betis","Real Madrid", "Real Sociedad","Real Valladolid CF","SD Eibar","Sevilla FC","Valencia CF","Villarreal CF"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

