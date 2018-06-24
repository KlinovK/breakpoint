//
//  CreateGroupsVC.swift
//  breakpoint
//
//  Created by Константин Клинов on 1/6/18.
//  Copyright © 2018 Константин Клинов. All rights reserved.
//

import UIKit
import Firebase

class CreateGroupsVC: UIViewController {

    //MARK: Outlets
    
    @IBOutlet weak var titleTextField: InsetTxtField!
    @IBOutlet weak var descriptionTextField: InsetTxtField!
    @IBOutlet weak var emailSearchTextField: InsetTxtField!
    @IBOutlet weak var groupMemberLbl: UILabel!
    @IBOutlet weak var doneBtn: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: Prop
    
    var emailArray = [String]()
    var choosenUserArray = [String]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        emailSearchTextField.delegate = self
        emailSearchTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        doneBtn.isHidden = true
    }
    

    @objc func textFieldDidChange(){
        if emailSearchTextField.text == "" {
            emailArray = []
            tableView.reloadData()
            
        } else {
            DataService.instance.getEmail(forSearchQuery: emailSearchTextField.text!, handler: { (returnedEmailArray) in
                self.emailArray = returnedEmailArray
                self.tableView.reloadData()
            })
        }
    }
    
    //MARK: Actions
    
    @IBAction func doneBtnWasPressed(_ sender: Any) {
        if titleTextField.text != "" && descriptionTextField.text != "" {
            DataService.instance.getIDs(forUsernames: choosenUserArray, handler: { (idsArray) in
                var userIDS = idsArray
                userIDS.append((Auth.auth().currentUser?.uid)!)
                
                DataService.instance.createGroup(withTitle: self.titleTextField.text!, andDescription: self.descriptionTextField.text!, forUsersIDs: userIDS, handler: { (groupCreated) in
                    if groupCreated {
                        self.dismiss(animated: true, completion: nil)
                    } else {
                        print("Group could not be created. Please try again!")
                    }
                })
            })
        }
    }
    
    @IBAction func closeBtnWasPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
}


extension CreateGroupsVC: UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return emailArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "userCell") as? UserCell else { return UITableViewCell() }
        let profileImage = UIImage(named: "defaultProfileImage")
        if choosenUserArray.contains(emailArray[indexPath.row]) {
          cell.configureCell(profileImage: profileImage!, email: emailArray[indexPath.row] , isSelected: true)
        } else {
            cell.configureCell(profileImage: profileImage!, email: emailArray[indexPath.row] , isSelected: false)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? UserCell else { return }
        if !choosenUserArray.contains(cell.emailLbl.text!) {
            choosenUserArray.append(cell.emailLbl.text!)
            groupMemberLbl.text = choosenUserArray.joined(separator: ", ")
            doneBtn.isHidden = false
        } else {
            choosenUserArray = choosenUserArray.filter({ $0 != cell.emailLbl.text! })
            if choosenUserArray.count >= 1 {
                groupMemberLbl.text = choosenUserArray.joined(separator: ", ")

                
            } else {
                groupMemberLbl.text = "add people to your group"
                doneBtn.isHidden = true
            }
        }
    }
   
    
}

extension CreateGroupsVC: UITextFieldDelegate {
    
}

