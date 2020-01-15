//
//  CustomButton.swift
//  Footics
//
//  Created by 김주훈 on 2020/01/08.
//  Copyright © 2020 김주훈. All rights reserved.
//

import Foundation
import UIKit

class CustomButton: UIButton{
    override init(frame: CGRect){
        super.init(frame: frame)
        setupButton()
    }
    
    
    required init?(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)
        setupButton()
    }
    
    func setupButton(){
        
    }
    

}
