//
//  ImageViewerViewController.swift
//  Footics
//
//  Created by 김주훈 on 2020/01/18.
//  Copyright © 2020 김주훈. All rights reserved.
//

import UIKit

class ImageViewerViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var teamNameLabel: UILabel!
    
    var imageName: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        teamNameLabel.text = imageName
        setupImageView()
    }
    
    private func setupImageView(){
        guard let name = imageName else{
            return }
        if let image = UIImage(named: name){
            imageView.image = image
        }
    }
}
