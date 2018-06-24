//
//  FeedCell.swift
//  breakpoint
//
//  Created by Константин Клинов on 1/5/18.
//  Copyright © 2018 Константин Клинов. All rights reserved.
//

import UIKit

class FeedCell: UITableViewCell {

    //MARK: Outlets
    
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var contentLbl: UILabel!
    
    
    //MARK: Configure cell
    
    func configureCell(profileImage: UIImage, email: String, content: String){
        self.profileImage.image = profileImage
        self.emailLbl.text = email
        self.contentLbl.text = content
    }
    
}
