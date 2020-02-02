//  Created by 김주훈 on 2020/01/15.
//  Copyright © 2020 김주훈. All rights reserved.
//

import UIKit


struct League{
    let leagueImage : String
    let description : String
    let countryImage : String
    let countryLabel : String
}

class LeagueTableViewController: UIViewController{
    
    var giveText = ""
    var giveArray : [String] = []
    var giveCountryName = ""
    let premier = ["Arsenal", "Aston Villa", "AFC Bournemouth", "Brighton and Hove Albion", "Burnley FC", "Chelsea FC", "Crystal Palace", "Everton", "Leicester City", "Liverpool", "Manchester City", "Manchester United",  "Newcastle United", "Norwich City", "Sheffield United", "Southampton", "Tottenham Hotspur", "Watford", "West Ham United", "Wolverhampton Wanderers"]
    
    let laliga = ["Athletic Club", "Atletico de Madrid", "Osasuna", "CD Leganes", "Alaves", "FC Barcelona", "Getafe CF", "Granada CF", "Levante UD", "RC Celta", "RCD Espanyol", "RCD Mallorca","Real Betis","Real Madrid","Real Sociedad", "Real Valladolid CF", "SD Eibar", "Sevilla FC", "Valencia CF", "Villarreal CF"]
    
    let serie = ["Atalanta BC","Bologna FC", "Brescia Calcio", "Cagliari Calcio", "ACF Fiorentina", "Genoa CFC", "Hellas Verona FC", "FC Inter Milan", "Juventus FC", "SS Lazio", "US Lecce", "AC Milan", "SSC Napoli", "Parma Calcio", "AS Roma", "UC Sampdoria", "US Sassuolo", "SPAL", "Torino FC", "Udinese Calcio"]
    
    let bundesliga = ["FC Bayern München","Borussia Dortmund","RB Leipzig", "Bayer 04 Leverkusen", "Borussia Mönchengladbach", "VfL Wolfsburg", "Eintracht Frankfurt", "SV Werder Bremen", "TSG 1899 Hoffenheim", "Fortuna Düsseldorf", "Hertha Berlin", "FSV Mainz 05", "SC Freiburg", "FC Schalke 04", "FC Augsburg", "FC Köln", "SC Paderborn 07", "FC Union Berlin"]
    
    let league1 = ["PARIS SAINT-GERMAIN", "OLYMPIQUE DE MARSEILLE", "Stade Rennais FC", "FC NANTES", "LOSC Lille", "MONTPELLIER HSC", "OLYMPIQUE LYONNAIS", "STADE DE REIMS", "AS Monaco FC", "ANGERS SCO", "OGC NICE", "RC Strasbourg Alsace","FC GIRONDINS DE BORDEAUX", "AS SAINT-ETIENNE", "Dijon FCO", "FC Metz", "AMIENS SC", "NIMES OLYMPIQUE", "Toulouse FC", "STADE BRESTOIS 29"]
    

    var leagueList:[League] = [
        League(leagueImage: "Premier", description: "Premier League", countryImage: "England", countryLabel: "England"),
    League(leagueImage: "Laliga", description: "Laliga", countryImage: "Spain", countryLabel: "Spain"),
    League(leagueImage: "SerieA", description: "SerieA", countryImage: "Italy", countryLabel: "Italy"),
    League(leagueImage: "Bundesliga", description: "Bundesliga", countryImage: "Germany", countryLabel: "Germany"),
    League(leagueImage: "league1", description: "League1", countryImage: "France", countryLabel: "France"),
    ]
    
    @IBOutlet var LeagueTableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        LeagueTableView.dataSource = self
        LeagueTableView.delegate = self
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let param = segue.destination as! ClubViewController
        param.receivedClubName = giveText
        param.receivedClubArray = giveArray
        param.receivedCountryName = giveCountryName
    }
}

extension LeagueTableViewController: UITableViewDelegate {}

extension LeagueTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.leagueList.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LeagueCell", for: indexPath) as! LeagueTableViewCell
        let leagueRowData = self.leagueList[indexPath.row]
        cell.leagueImage.image = UIImage(named: leagueRowData.leagueImage)
        cell.leagueImage.layer.cornerRadius = 8.0
        cell.leagueImage.layer.masksToBounds = true
        cell.descriptLabel.text = leagueRowData.description
        cell.countryImage.image = UIImage(named: leagueRowData.countryImage)
        cell.countryLabel.text = leagueRowData.countryLabel
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        giveText = leagueList[indexPath.row].description
        giveCountryName = leagueList[indexPath.row].countryLabel
        switch indexPath.row{
        case 0:
            giveArray = premier
        case 1:
            giveArray = laliga
        case 2:
            giveArray = serie
        case 3:
            giveArray = bundesliga
        case 4:
            giveArray = league1
        default:
            break
        }
        self.performSegue(withIdentifier: "clubView", sender: nil)
        }
    }

