//
//  GroupCell.swift
//  breakpoint
//
//  Created by Константин Клинов on 1/7/18.
//  Copyright © 2018 Константин Клинов. All rights reserved.
//

import UIKit

class GroupCell: UITableViewCell {

    //MARK: Outlets
    
    
    @IBOutlet weak var groupTitleLbl: UILabel!
    @IBOutlet weak var groupDescriptionLbl: UILabel!
    @IBOutlet weak var memberCountLbl: UILabel!
    
    func configureCell(title: String, description: String, memberCount: Int){
        self.groupTitleLbl.text = title
        self.groupDescriptionLbl.text = description
        self.memberCountLbl.text = "\(memberCount) members"
    }
    
    
    //MARK: Actions
    
    

}
