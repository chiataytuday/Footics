//  Created by 김주훈 on 2020/01/15.
//  Copyright © 2020 김주훈. All rights reserved.
//

import UIKit


struct League{
    let leagueImage : String
    let description : String
}


class LeagueTableViewController: UIViewController{
    
    var leagueList:[League] = [
    League(leagueImage: "Premier", description: "잉글랜드의 최상위 프로축구 리그인 프리미어리그\n(England-Premier League)"),
    League(leagueImage: "Laliga", description: "스페인의 최상위 프로축구 리그인 프리메라리가\n(Spain-Primera Liga)"),
    League(leagueImage: "SerieA", description: "이탈리아의 최상위 프로축구 리그인 세리에A\n(Italy-SerieA)"),
    League(leagueImage: "Bundesliga", description: "독일의 최상위 프로축구 리그인 분데스리가\n(Germany-Bundesliga)"),
    League(leagueImage: "league1", description: "프랑스의 최상위 프로축구 리그인 리그앙\n(France-League1)"),
    ]
    
    @IBOutlet var LeagueTableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        LeagueTableView.dataSource = self
        LeagueTableView.delegate = self
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
        return cell
    }
    
}
