//
//  ShadowView.swift
//  breakpoint
//
//  Created by Константин Клинов on 1/3/18.
//  Copyright © 2018 Константин Клинов. All rights reserved.
//

import UIKit

class ShadowView: UIView {

    override func awakeFromNib() {
        
        self.layer.shadowOpacity = 0.75
        self.layer.shadowRadius = 5
        self.layer.shadowColor = UIColor.black.cgColor
        super.awakeFromNib()
    }
    
   
    
    
}
