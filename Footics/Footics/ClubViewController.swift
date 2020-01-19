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
    
    var receivedClubName = ""
    var receivedClubArray : [String] = []
    var sendClubName = ""
    
    var collectionViewFlowLayout: UICollectionViewFlowLayout!
    let cellIdentifier = "ClubCollectionViewCell"
    let viewClubSegueIdentifier = "viewClubSegueIdentifier"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        teamDesriptionLabel.text = receivedClubName
        setupCollectionView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        setupCollectionViewIttemSize()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let param = segue.destination as! ImageViewerViewController
        param.imageName = sendClubName
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
}

extension ClubViewController: UICollectionViewDelegate, UICollectionViewDataSource{
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
