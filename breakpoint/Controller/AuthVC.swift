//
//  AuthVC.swift
//  breakpoint
//
//  Created by Константин Клинов on 1/3/18.
//  Copyright © 2018 Константин Клинов. All rights reserved.
//

import UIKit
import Firebase

class AuthVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if Auth.auth().currentUser != nil {
            dismiss(animated: true, completion: nil)
        }
    }
    
    //MARK: Actions
    
    
    @IBAction func signinWithEmailBtnWasPressed(_ sender: Any) {
        let loginVC = storyboard?.instantiateViewController(withIdentifier: "LoginVC")
        present(loginVC!, animated: true, completion: nil)
    }
    
    @IBAction func googleSiginBtnWasPressed(_ sender: Any) {
    }
    
    @IBAction func facebookSigninBtnWasPressed(_ sender: Any) {
    }
    



}
