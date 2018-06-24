//
//  GroupFeedCell.swift
//  breakpoint
//
//  Created by Константин Клинов on 1/8/18.
//  Copyright © 2018 Константин Клинов. All rights reserved.
//

import UIKit

class GroupFeedCell: UITableViewCell {

    //MARK: Outlets
   
    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var contentLbl: UILabel!
    @IBOutlet weak var emailLbl: UILabel!
    
    func configureCell(profileImg: UIImage, email: String, content: String){
        self.profileImg.image = profileImg
        self.emailLbl.text = email
        self.contentLbl.text = content
    }
    
}
