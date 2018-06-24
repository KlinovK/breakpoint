//
//  LoginVC.swift
//  breakpoint
//
//  Created by Константин Клинов on 1/3/18.
//  Copyright © 2018 Константин Клинов. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    //MARK: Outlets
    
    @IBOutlet weak var emailField: InsetTxtField!
    @IBOutlet weak var passwordField: InsetTxtField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
emailField.delegate = self
        passwordField.delegate = self
       
    }

    //MARK: Actions
    
    @IBAction func signinBtnWasPressed(_ sender: Any) {
        if emailField.text != "" && passwordField.text != "" {
            AuthService.instance.loginUser(withEmail: emailField.text!, andPassword: passwordField.text!, loginComplete: { (success, loginError) in
                if success {
                    self.dismiss(animated: true, completion: nil)
                } else {
                    print(String(describing: loginError?.localizedDescription))
                }
                
                AuthService.instance.registerUser(withEmail: self.emailField.text!, andPassword: self.passwordField.text!, userCreationComplete: { (success, registrationError) in
                    if success {
                        AuthService.instance.loginUser(withEmail: self.emailField.text!, andPassword: self.passwordField.text!, loginComplete: { (sucess, nil) in
                           self.dismiss(animated: true, completion: nil)
                            print("Success registering!")
                        })
                    } else {
                        print(String(describing:registrationError?.localizedDescription))
                    }
                })
                
                
            })
        }
    }
    
    @IBAction func closeBtnWasPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}

extension LoginVC: UITextFieldDelegate {
    
}
