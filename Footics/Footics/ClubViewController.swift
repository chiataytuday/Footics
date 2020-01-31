//
//  PremierClubViewController.swift
//  Footics
//
//  Created by 김주훈 on 2020/01/16.
//  Copyright © 2020 김주훈. All rights reserved.
//

import UIKit

class ClubViewController: UIViewController{

    
    @IBOutlet var teamDesriptionLabel: UILabel!
    
    @IBOutlet var clubCollectionView: UICollectionView!
    
    @IBOutlet weak var teamOneLabel: UILabel!
    @IBOutlet weak var teamTwoLabel: UILabel!
    @IBOutlet weak var teamOneLogo: UIImageView!
    @IBOutlet weak var teamTwoLogo: UIImageView!
    
    @IBOutlet weak var predictShow: UIButton!
    
    var receivedClubName = ""
    var receivedClubArray : [String] = []
    var receivedCountryName = ""
    var sendClubName = ""
    var teamOne = ""
    var teamTwo = ""
    
    var collectionViewFlowLayout: UICollectionViewFlowLayout!
    let cellIdentifier = "ClubCollectionViewCell"
    let viewClubSegueIdentifier = "viewClubSegueIdentifier"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        teamDesriptionLabel.text = receivedClubName
        teamOneLabel.text = "Team1을 선택하세요."
        teamTwoLabel.text = "Team2를 선택하세요."
        setupCollectionView()
        clubCollectionView.delegate = self
        clubCollectionView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        setupCollectionViewIttemSize()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier! {
            case "viewClubSegueIdentifier":
                let param = segue.destination as! ImageViewerViewController
                param.imageName = sendClubName
                param.leagueName = receivedClubName
                param.CountryName = receivedCountryName
            case "predictResultShowIdentifier":
                let param = segue.destination as! ResultPredictViewController
                param.teamOne = teamOne
                param.teamTwo = teamTwo
            default:
                break
        }

        
    }
    
    private func setupCollectionView() {
        clubCollectionView.delegate = self
        clubCollectionView.dataSource = self
        let nib = UINib(nibName: "ClubCollectionViewCell" , bundle: nil)
        clubCollectionView.register(nib, forCellWithReuseIdentifier: cellIdentifier)
    }
    
    private func setupCollectionViewIttemSize() {
        if collectionViewFlowLayout == nil{
            let numberOfItemPerRow: CGFloat = 3
            let lineSpacing: CGFloat = 50
            let interItemSpacing: CGFloat = 10
            
            let width = (clubCollectionView.frame.width - (numberOfItemPerRow - 1) * interItemSpacing) / numberOfItemPerRow
            let height = width
            
            collectionViewFlowLayout = UICollectionViewFlowLayout()
            
            collectionViewFlowLayout.itemSize = CGSize(width: width, height: height)
            collectionViewFlowLayout.sectionInset = UIEdgeInsets.zero
            collectionViewFlowLayout.minimumLineSpacing = lineSpacing
            collectionViewFlowLayout.minimumLineSpacing = interItemSpacing
            
            clubCollectionView.setCollectionViewLayout(collectionViewFlowLayout, animated: true)
        }
    }

    
    @IBAction func predictViewButton(_ sender: UIButton) {

 
        }
}

extension ClubViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    @IBAction func unwindToClubView(_ sender: UIStoryboardSegue){
            let vc = sender.source as! ImageViewerViewController

            if teamOne != ""{
                teamTwo = vc.ClubName
            } else{
                teamOne = vc.ClubName
            }
            teamOneLabel.text = teamOne
            teamOneLogo.image = UIImage(named: teamOne)
            teamTwoLabel.text = teamTwo
            teamTwoLogo.image = UIImage(named: teamTwo)
        if ((teamOne != "" ) && (teamTwo != "")) {
            predictShow.setTitle("결과 보기", for: .normal)
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection: Int) -> Int{
        return receivedClubArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! ClubCollectionViewCell
        cell.imageView.image = UIImage(named: receivedClubArray[indexPath.item])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let club = receivedClubArray[indexPath.item]
        sendClubName = club
        performSegue(withIdentifier: viewClubSegueIdentifier, sender: club)
    }
    
    
}

