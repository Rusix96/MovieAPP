//
//  UIViewController.swift
//  MovieAPP
//
//  Created by Rusik on 12/06/2019.
//  Copyright © 2019 Rusik. All rights reserved.
//

import Foundation
import UIKit

//Extension for keyboard Hide
extension UIViewController {
    
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
}
