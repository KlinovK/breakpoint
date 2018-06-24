//
//  UserCell.swift
//  breakpoint
//
//  Created by Константин Клинов on 1/6/18.
//  Copyright © 2018 Константин Клинов. All rights reserved.
//

import UIKit

class UserCell: UITableViewCell {

    //MARK: Outlets

    
    @IBOutlet weak var checkImage: UIImageView!
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    
    //MARK: Prop
    
    var showing = false
    
    func configureCell(profileImage image: UIImage, email: String, isSelected: Bool){
        self.profileImage.image = image
        self.emailLbl.text = email
        if isSelected {
            self.checkImage.isHidden = false
        } else {
            self.checkImage.isHidden = true
        }
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        if selected {
            if showing == false {
            checkImage.isHidden = false
                showing = true
        } else {
            checkImage.isHidden = true
            showing = false
        }
    }
}
}
    
    //MARK: Actions
    
    

