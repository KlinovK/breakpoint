//
//  UIViewControllerRxt.swift
//  breakpoint
//
//  Created by Константин Клинов on 1/8/18.
//  Copyright © 2018 Константин Клинов. All rights reserved.
//

import UIKit

extension UIViewController {
    func presentDetail(_ viewControlletToPresent: UIViewController){
        let transition = CATransition()
        transition.duration = 0.3
        transition.type = kCATransitionPush
        transition.subtype = kCATransitionFromRight
        self.view.window?.layer.add( transition, forKey: kCATransition)
        
        present(viewControlletToPresent, animated: false, completion: nil)
    }
    
    func dismissDetail(_ viewControlletToPresent: UIViewController){
        let transition = CATransition()
        transition.duration = 0.3
        transition.type = kCATransitionPush
        transition.subtype = kCATransitionFromLeft
        self.view.window?.layer.add( transition, forKey: kCATransition)
        
        dismiss(animated: false, completion: nil)
    }
    
}
